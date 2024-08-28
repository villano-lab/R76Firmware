#include "Def.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

#include  "R76Firmware_lib.h"

#define BOARD_IP_ADDRESS "192.168.15.116"




int main(int argc, char* argv[])
{
	NI_HANDLE handle;
	int ret;
	uint32_t    val;


	R_Init();


	if(R_ConnectDevice(BOARD_IP_ADDRESS, 8888, &handle) != 0) { printf("Unable to connect to the board!\n"); return (-1); };
#ifndef CUSTOM_EXAMPLE		
	
	/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_osc = 0;
	uint32_t data_osc[1024];
	uint32_t read_data_osc;
	uint32_t valid_data_osc;
	uint32_t position = 0;
	int32_t decimator = 0;
	int32_t pre_trigger = 100;
	int32_t software_trigger = 0;
	int32_t analog_trigger = 1;
	int32_t digital0_trigger = 0;
	int32_t digital1_trigger = 0;
	int32_t digital2_trigger = 0;
	int32_t digital3_trigger = 0;
	int32_t trigger_channel = 0;
	int32_t trigger_edge = 0;
	int32_t trigger_level = 1000;
	int32_t timeout_osc = 1000;
	int32_t size_osc = 1024;
	uint32_t read_analog[1024];
	uint32_t read_digital0[1024];
	uint32_t read_digital1[1024];
	uint32_t read_digital2[1024];
	uint32_t read_digital3[1024];
	int Osc_Events = 10;
	int e = 0;
	while (e<Osc_Events)
	{
		if (OSCILLOSCOPE_Analog_SET_PARAMETERS(decimator, pre_trigger, software_trigger, analog_trigger, digital0_trigger, digital1_trigger,
			digital2_trigger, digital3_trigger, trigger_channel, trigger_edge, trigger_level, &handle) != 0) printf("Set Parameters Error");
		if (OSCILLOSCOPE_Analog_START(&handle) != 0) printf("Start Error");
		while (status_osc != 1)
			if (OSCILLOSCOPE_Analog_STATUS(&status_osc, &handle) != 0) printf("Status Error");

		if (OSCILLOSCOPE_Analog_POSITION(&position, &handle) != 0) printf("Position Error");
		if (OSCILLOSCOPE_Analog_DOWNLOAD(data_osc, size_osc, timeout_osc, &handle, &read_data_osc, &valid_data_osc) != 0) printf("Get Data Error");
		if (OSCILLOSCOPE_Analog_RECONSTRUCT(data_osc, position, pre_trigger, read_analog, read_digital0, read_digital1, read_digital2, read_digital3) != 0) printf("Reconstruction Error");
		e++;
	}
	printf("Download Finished");
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_osc = 0;
	uint32_t data_osc[1024];
	uint32_t read_data_osc;
	uint32_t valid_data_osc;
	uint32_t position = 0;
	int32_t decimator = 0;
	int32_t pre_trigger = 100;
	int32_t software_trigger = 0;
	int32_t analog_trigger = 1;
	int32_t digital0_trigger = 0;
	int32_t digital1_trigger = 0;
	int32_t digital2_trigger = 0;
	int32_t digital3_trigger = 0;
	int32_t trigger_channel = 0;
	int32_t trigger_edge = 0;
	int32_t trigger_level = 1000;
	int32_t timeout_osc = 1000;
	int32_t size_osc = 1024;
	uint32_t read_analog[1024];
	uint32_t read_digital0[1024];
	uint32_t read_digital1[1024];
	uint32_t read_digital2[1024];
	uint32_t read_digital3[1024];
	int Osc_Events = 10;
	int e = 0;
	while (e<Osc_Events)
	{
		if (OSCILLOSCOPE_Energies_SET_PARAMETERS(decimator, pre_trigger, software_trigger, analog_trigger, digital0_trigger, digital1_trigger,
			digital2_trigger, digital3_trigger, trigger_channel, trigger_edge, trigger_level, &handle) != 0) printf("Set Parameters Error");
		if (OSCILLOSCOPE_Energies_START(&handle) != 0) printf("Start Error");
		while (status_osc != 1)
			if (OSCILLOSCOPE_Energies_STATUS(&status_osc, &handle) != 0) printf("Status Error");

		if (OSCILLOSCOPE_Energies_POSITION(&position, &handle) != 0) printf("Position Error");
		if (OSCILLOSCOPE_Energies_DOWNLOAD(data_osc, size_osc, timeout_osc, &handle, &read_data_osc, &valid_data_osc) != 0) printf("Get Data Error");
		if (OSCILLOSCOPE_Energies_RECONSTRUCT(data_osc, position, pre_trigger, read_analog, read_digital0, read_digital1, read_digital2, read_digital3) != 0) printf("Reconstruction Error");
		e++;
	}
	printf("Download Finished");
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_osc = 0;
	uint32_t data_osc[1024];
	uint32_t read_data_osc;
	uint32_t valid_data_osc;
	uint32_t position = 0;
	int32_t decimator = 0;
	int32_t pre_trigger = 100;
	int32_t software_trigger = 0;
	int32_t analog_trigger = 1;
	int32_t digital0_trigger = 0;
	int32_t digital1_trigger = 0;
	int32_t digital2_trigger = 0;
	int32_t digital3_trigger = 0;
	int32_t trigger_channel = 0;
	int32_t trigger_edge = 0;
	int32_t trigger_level = 1000;
	int32_t timeout_osc = 1000;
	int32_t size_osc = 1024;
	uint32_t read_analog[1024];
	uint32_t read_digital0[1024];
	uint32_t read_digital1[1024];
	uint32_t read_digital2[1024];
	uint32_t read_digital3[1024];
	int Osc_Events = 10;
	int e = 0;
	while (e<Osc_Events)
	{
		if (OSCILLOSCOPE_Analog_In_Unflipped_SET_PARAMETERS(decimator, pre_trigger, software_trigger, analog_trigger, digital0_trigger, digital1_trigger,
			digital2_trigger, digital3_trigger, trigger_channel, trigger_edge, trigger_level, &handle) != 0) printf("Set Parameters Error");
		if (OSCILLOSCOPE_Analog_In_Unflipped_START(&handle) != 0) printf("Start Error");
		while (status_osc != 1)
			if (OSCILLOSCOPE_Analog_In_Unflipped_STATUS(&status_osc, &handle) != 0) printf("Status Error");

		if (OSCILLOSCOPE_Analog_In_Unflipped_POSITION(&position, &handle) != 0) printf("Position Error");
		if (OSCILLOSCOPE_Analog_In_Unflipped_DOWNLOAD(data_osc, size_osc, timeout_osc, &handle, &read_data_osc, &valid_data_osc) != 0) printf("Get Data Error");
		if (OSCILLOSCOPE_Analog_In_Unflipped_RECONSTRUCT(data_osc, position, pre_trigger, read_analog, read_digital0, read_digital1, read_digital2, read_digital3) != 0) printf("Reconstruction Error");
		e++;
	}
	printf("Download Finished");
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_osc = 0;
	uint32_t data_osc[1024];
	uint32_t read_data_osc;
	uint32_t valid_data_osc;
	uint32_t position = 0;
	int32_t decimator = 0;
	int32_t pre_trigger = 100;
	int32_t software_trigger = 0;
	int32_t analog_trigger = 1;
	int32_t digital0_trigger = 0;
	int32_t digital1_trigger = 0;
	int32_t digital2_trigger = 0;
	int32_t digital3_trigger = 0;
	int32_t trigger_channel = 0;
	int32_t trigger_edge = 0;
	int32_t trigger_level = 1000;
	int32_t timeout_osc = 1000;
	int32_t size_osc = 1024;
	uint32_t read_analog[1024];
	uint32_t read_digital0[1024];
	uint32_t read_digital1[1024];
	uint32_t read_digital2[1024];
	uint32_t read_digital3[1024];
	int Osc_Events = 10;
	int e = 0;
	while (e<Osc_Events)
	{
		if (OSCILLOSCOPE_diag_SET_PARAMETERS(decimator, pre_trigger, software_trigger, analog_trigger, digital0_trigger, digital1_trigger,
			digital2_trigger, digital3_trigger, trigger_channel, trigger_edge, trigger_level, &handle) != 0) printf("Set Parameters Error");
		if (OSCILLOSCOPE_diag_START(&handle) != 0) printf("Start Error");
		while (status_osc != 1)
			if (OSCILLOSCOPE_diag_STATUS(&status_osc, &handle) != 0) printf("Status Error");

		if (OSCILLOSCOPE_diag_POSITION(&position, &handle) != 0) printf("Position Error");
		if (OSCILLOSCOPE_diag_DOWNLOAD(data_osc, size_osc, timeout_osc, &handle, &read_data_osc, &valid_data_osc) != 0) printf("Get Data Error");
		if (OSCILLOSCOPE_diag_RECONSTRUCT(data_osc, position, pre_trigger, read_analog, read_digital0, read_digital1, read_digital2, read_digital3) != 0) printf("Reconstruction Error");
		e++;
	}
	printf("Download Finished");
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_osc = 0;
	uint32_t data_osc[1024];
	uint32_t read_data_osc;
	uint32_t valid_data_osc;
	uint32_t position = 0;
	int32_t decimator = 0;
	int32_t pre_trigger = 100;
	int32_t software_trigger = 0;
	int32_t analog_trigger = 1;
	int32_t digital0_trigger = 0;
	int32_t digital1_trigger = 0;
	int32_t digital2_trigger = 0;
	int32_t digital3_trigger = 0;
	int32_t trigger_channel = 0;
	int32_t trigger_edge = 0;
	int32_t trigger_level = 1000;
	int32_t timeout_osc = 1000;
	int32_t size_osc = 1024;
	uint32_t read_analog[1024];
	uint32_t read_digital0[1024];
	uint32_t read_digital1[1024];
	uint32_t read_digital2[1024];
	uint32_t read_digital3[1024];
	int Osc_Events = 10;
	int e = 0;
	while (e<Osc_Events)
	{
		if (OSCILLOSCOPE_baselines_SET_PARAMETERS(decimator, pre_trigger, software_trigger, analog_trigger, digital0_trigger, digital1_trigger,
			digital2_trigger, digital3_trigger, trigger_channel, trigger_edge, trigger_level, &handle) != 0) printf("Set Parameters Error");
		if (OSCILLOSCOPE_baselines_START(&handle) != 0) printf("Start Error");
		while (status_osc != 1)
			if (OSCILLOSCOPE_baselines_STATUS(&status_osc, &handle) != 0) printf("Status Error");

		if (OSCILLOSCOPE_baselines_POSITION(&position, &handle) != 0) printf("Position Error");
		if (OSCILLOSCOPE_baselines_DOWNLOAD(data_osc, size_osc, timeout_osc, &handle, &read_data_osc, &valid_data_osc) != 0) printf("Get Data Error");
		if (OSCILLOSCOPE_baselines_RECONSTRUCT(data_osc, position, pre_trigger, read_analog, read_digital0, read_digital1, read_digital2, read_digital3) != 0) printf("Reconstruction Error");
		e++;
	}
	printf("Download Finished");
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

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

	//Configuration flag
	int32_t FrameSync = 0;
	int32_t	FrameWait = 0;
	int32_t	FrameMask = 3;
	int32_t	FrameExternalTrigger = 0;
	int32_t	FrameOrTrigger = 1;

	void *BufferDownloadHandler = NULL;
	Utility_ALLOCATE_DOWNLOAD_BUFFER(&BufferDownloadHandler, 1024*1024);
	printf("%x\n", BufferDownloadHandler);

	if (CPACK_All_Energies_RESET(&handle) != 0) printf("Reset Error");
	if (CPACK_All_Energies_START(&handle) != 0) printf("Start Error");
	if (CPACK_All_Energies_STATUS(&status_frame, &handle) != 0) printf("Status Error");
	if (status_frame >0)
	{
		while (1)
		{
			valid_data_frame = 0;
			if (CPACK_All_Energies_DOWNLOAD(&data_frame, N_Packet * (<<<PACKET_SIZE_HERE_IN_WORK>>>), timeout_frame, &handle, &read_data_frame, &valid_data_frame) != 0) printf("Data Download Error");
			
			valid_data_enqueued = 0;
			Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(BufferDownloadHandler, data_frame, valid_data_frame, &valid_data_enqueued);

			if (CPACK_All_Energies_RECONSTRUCT_DATA(BufferDownloadHandler, &decoded_packets) == 0)
			{
				printf(".");
				for (int i =0;i<decoded_packets.valid_packets;i++){
				    t_CP_0_struct *data = decoded_packets.packets[i].payload;
				    printf("%d\n", data->row[0]);
				}
				free_packet_collection(&decoded_packets);
			}
			ReadDataNumber = ReadDataNumber+ N_Packet;
	}
		printf("Download completed");
	}
	else printf("Status Error");

*/


	
#else

#endif

	return 0;
}

 