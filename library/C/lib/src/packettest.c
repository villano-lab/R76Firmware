#include "Legacy/Def.h"
#include "Legacy/circular_buffer.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <unistd.h>

#include "Legacy/R76Firmware_lib.h"
#include "UniversalTriggerShared.h"

const char* program_name = "packettest";
int waittime=100; //default 2 packets.

void print_usage(FILE* stream, int exit_code){ //This looks unaligned but lines up correctly in the terminal output
	fprintf (stream, "Usage:  %s options \n", program_name);
	fprintf (stream, VERBOSE_TEXT);
	fprintf (stream, SILENT_TEXT);
	fprintf (stream, LOG_TEXT);
	fprintf (stream, VERSION_TEXT);
	fprintf (stream, HELP_TEXT);
    fprintf (stream, "-w,    --wait  <#> Set the number of packets to wait to collect before exiting. (integer. if not supplied, waits for 100 packets.)\n");
	exit (exit_code);
};

int main(int argc, char* argv[])
{
	//Read options
	while(iarg != -1){
		iarg = getopt_long(argc, argv, "l::sh?v::Vw:", longopts, &ind);
		switch (iarg){
		case 'h':
			print_usage(stdout,0);
			return 0;
			break;
		case 'q':
			verbose = -1;
			break;
		case 's':
			verbose = -1;
			break;
		case 'v':
			if(optarg){
				verbose = atoi(optarg);
			}else{verbose = 1;};
			break;
		case '?':
			print_usage(stdout,0);
			return 0;
			break;
		case 'V':
			printf("Get Spectrum\n");
			copyright();
			return 0;
			break;
		case 'l':
			if(optarg){
				logfile = fopen(optarg,"w");
			}else{
				logfile = fopen("log.txt","w");
			};
			break;
        case 'w':
            waittime = atoi(optarg);
            break;        
		}
	}

    //Verbosity message
	if(verbose > 0){
		printf("Running in verbose mode. Verbosity: %d\n",verbose);
	};

    //Connect to the board.
	int connect_q = connect_staticaddr(verbose);
	if(connect_q != 0){
		printf("Board connection error code: %d\n",connect_q);
		return connect_q;
	}

    //Stuff to call later
    uint32_t status_frame = 0;
	uint32_t N_Packet = 100;
	uint32_t data_frame[100000];
	uint32_t read_data_frame;
	uint32_t valid_data_frame;
	uint32_t valid_data_enqueued;
	uint32_t N_Total_Events = 10000;
	uint32_t ReadDataNumber = 0;
	int32_t timeout_frame = 1000;
	t_generic_event_collection decoded_packets;
    void *BufferDownloadHandler = NULL;
    //Configuration flag
	int32_t FrameSync = 0;
	int32_t	FrameWait = 0;
	int32_t	FrameMask = 3;
	int32_t	FrameExternalTrigger = 0;
	int32_t	FrameOrTrigger = 1;
	//exit codes for sub-whatevers.
	int code;

    //Allocate buffer!
	code = Utility_ALLOCATE_DOWNLOAD_BUFFER(&BufferDownloadHandler, 1024*1024);
	if(verbose>-1){printf("BufferDownloadHandler: %p.\n",BufferDownloadHandler);}
	if(code != 0){printf("Buffer allocation failed.\n");}

    //Reset everything right before starting, just in case.
    if (CPACK_All_Energies_RESET(&handle) != 0) printf("Reset Error\n");
	if (CPACK_All_Energies_START(&handle) != 0) printf("Start Error\n");

    //Pull the data!
	Utility_ALLOCATE_DOWNLOAD_BUFFER(&BufferDownloadHandler, 1024*1024);

	if (CPACK_All_Energies_RESET(&handle) != 0) printf("Reset Error\n");
	if (CPACK_All_Energies_START(&handle) != 0) printf("Start Error\n");
	if (CPACK_All_Energies_STATUS(&status_frame, &handle) != 0) printf("Status Error\n");
	if (status_frame >0)
	{
        if(logfile != NULL){
            fprintf(logfile,"Packet #,word label,value\n");
        }
        int j = 0;
        while(j<waittime){
            valid_data_frame = 0;
            if(verbose > 0){printf("Downloading new dataset.\n");}
            if (CPACK_All_Energies_DOWNLOAD(&data_frame, N_Packet * (18), timeout_frame, &handle, &read_data_frame, &valid_data_frame) != 0) printf("Data Download Error\n");
            
            valid_data_enqueued = 0;
            if(verbose > 1){printf("Enqueuing data.\n");}
            Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(BufferDownloadHandler, data_frame, valid_data_frame, &valid_data_enqueued);

            if(verbose > 1){printf("Reconstructing data.\n");}
            if (CPACK_All_Energies_RECONSTRUCT_DATA(BufferDownloadHandler, &decoded_packets, verbose, handle) == 0)
            {
                if(verbose>=0){printf(".");}
                if(verbose>=0){printf("\n");}
                if(verbose>2){printf("i: %d\n",i);}
                if(verbose>1){printf("Valid Packets: %d \n",decoded_packets.valid_packets);}
                for (int i = 0;i<decoded_packets.valid_packets;i++){
                    if(verbose>2){printf("Reading out decoded packet...\n");}
                    t_All_Energies_struct *data = decoded_packets.packets[i].payload;
                    for(int n=0;n<18;n++){
                        //For now I'm abusing my log function in order to print to file.
                        if(logfile != NULL){
                            fprintf(logfile,"%d, ",j);
                            if(n==0){
                                fprintf(logfile, "timestamp, ");
                            }else if(n==1){
                                fprintf(logfile,"trigger_code, ");
                            }else{
                                fprintf(logfile,"energy_ch_%02d, ",n*2-4); //start on row 2, so going to be 4 off
                            }
                            if(n<=1){
                                fprintf(logfile,"%u\n",data->row[n]);
                            }else{
                                uint16_t lower_word = (uint16_t) (data->row[n] & 0xFFFFUL);
                                uint16_t upper_word = (uint16_t) ((data->row[n] >> 16) & 0xFFFFUL);
                                fprintf(logfile,"%u\n%d, energy_ch_%02d, %u\n",(uint32_t)lower_word,j,n*2-3,(uint32_t)upper_word);
                            }
                        }
                        if(verbose > -1){printf("Row #%02d",n+1);}
                        if(verbose > -1 && n > 13){printf(" (No input)");}
                        if(verbose > -1){printf(": %08x\n", data->row[n]);}
                    }
                if(verbose > 1){
                    uint32_t trig_value;
                    if(verbose > 2){printf("%p\n",&handle);}
                    code = REG_trigger_code_GET(&trig_value,&handle);
                    if(code != 0){
                        printf("Retrieving trigger_code failed!\n");
                    }else{
                        printf("Trigger code (NOT retrieved at same time as packet!): %06x\n",trig_value);
                    }
                }
                if(verbose > -1){printf("=====\n");}
                }
                if(verbose>2){printf("Freeing packets... (Is that what this line even does?)\n");}
                //free_packet_collection(&decoded_packets); //this is broken, that's not good.
            }else{
                printf("Reconstruction failed.\n");
                return -1;
            }
            if(verbose > 2){printf("Incrementing ReadDataNumber.\n");}
            ReadDataNumber = ReadDataNumber + N_Packet;
            j++;
        }
		if(verbose >-1){printf("Download completed\n");}
	}
	else printf("Status Error");
    return 0;
}

/* STATUS:
Bulk of things are working. There are two major issues:
1. The custom packet's copy of the trigger information always gives 0, why?
- duplicating the previous row works, so it's not an issue reading this row number.
2. free_packet_collection causes a seg fault, which means that our only 
working option is probably leaking memory.

Something I am wondering: Am I getting the integration values at the right time?
I think that I should be waiting until the energy data from the charge integrator
is valid/ready, but this will exacerbate the issues with the trigger information,
so I want to troubleshoot that first.
*/