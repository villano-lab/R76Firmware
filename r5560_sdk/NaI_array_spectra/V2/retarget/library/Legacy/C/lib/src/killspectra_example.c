#include "Def.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

#include  "killspectra_lib.h"

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

	uint32_t status_spectrum= 0;
	int32_t Rebin = 0;
	int32_t LimitMode = 0;
	int32_t LimitValue = 0;
	uint32_t data_spectrum[256];
	uint32_t read_data_spectrum;
	uint32_t valid_data_spectrum;
	uint32_t bins = 256;
	int32_t timeout_spectrum = 1000;
	uint32_t spectrum[256];

	if (SPECTRUM_CH1_spectrum_SET_PARAMETERS(Rebin, LimitMode, LimitValue, &handle) != 0) printf("Set Parameters Error");
	if (SPECTRUM_CH1_spectrum_FLUSH(&handle) != 0) printf("Flush Error");
	if (SPECTRUM_CH1_spectrum_RESET(&handle) != 0) printf("Reset Error");
	if (SPECTRUM_CH1_spectrum_START(&handle) == 0) {
		if (SPECTRUM_CH1_spectrum_STATUS(&status_spectrum, &handle) == 0) {
			while (status_spectrum != 0)
			{
				if (SPECTRUM_CH1_spectrum_DOWNLOAD(&data_spectrum, bins, timeout_spectrum, &handle, &read_data_spectrum, &valid_data_spectrum) == 0)
				{
					for (int i = 0; i < 256; i++)
						spectrum[i] = data_spectrum[i];
				}
				else  printf("Data Download Error");
			}
			if (SPECTRUM_CH1_spectrum_STOP(&handle) != 0) printf("Stop Error");
		}
	}
	else printf("Start Error");
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_spectrum= 0;
	int32_t Rebin = 0;
	int32_t LimitMode = 0;
	int32_t LimitValue = 0;
	uint32_t data_spectrum[256];
	uint32_t read_data_spectrum;
	uint32_t valid_data_spectrum;
	uint32_t bins = 256;
	int32_t timeout_spectrum = 1000;
	uint32_t spectrum[256];

	if (SPECTRUM_CH2_spectrum_SET_PARAMETERS(Rebin, LimitMode, LimitValue, &handle) != 0) printf("Set Parameters Error");
	if (SPECTRUM_CH2_spectrum_FLUSH(&handle) != 0) printf("Flush Error");
	if (SPECTRUM_CH2_spectrum_RESET(&handle) != 0) printf("Reset Error");
	if (SPECTRUM_CH2_spectrum_START(&handle) == 0) {
		if (SPECTRUM_CH2_spectrum_STATUS(&status_spectrum, &handle) == 0) {
			while (status_spectrum != 0)
			{
				if (SPECTRUM_CH2_spectrum_DOWNLOAD(&data_spectrum, bins, timeout_spectrum, &handle, &read_data_spectrum, &valid_data_spectrum) == 0)
				{
					for (int i = 0; i < 256; i++)
						spectrum[i] = data_spectrum[i];
				}
				else  printf("Data Download Error");
			}
			if (SPECTRUM_CH2_spectrum_STOP(&handle) != 0) printf("Stop Error");
		}
	}
	else printf("Start Error");
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_spectrum= 0;
	int32_t Rebin = 0;
	int32_t LimitMode = 0;
	int32_t LimitValue = 0;
	uint32_t data_spectrum[256];
	uint32_t read_data_spectrum;
	uint32_t valid_data_spectrum;
	uint32_t bins = 256;
	int32_t timeout_spectrum = 1000;
	uint32_t spectrum[256];

	if (SPECTRUM_CH3_spectrum_SET_PARAMETERS(Rebin, LimitMode, LimitValue, &handle) != 0) printf("Set Parameters Error");
	if (SPECTRUM_CH3_spectrum_FLUSH(&handle) != 0) printf("Flush Error");
	if (SPECTRUM_CH3_spectrum_RESET(&handle) != 0) printf("Reset Error");
	if (SPECTRUM_CH3_spectrum_START(&handle) == 0) {
		if (SPECTRUM_CH3_spectrum_STATUS(&status_spectrum, &handle) == 0) {
			while (status_spectrum != 0)
			{
				if (SPECTRUM_CH3_spectrum_DOWNLOAD(&data_spectrum, bins, timeout_spectrum, &handle, &read_data_spectrum, &valid_data_spectrum) == 0)
				{
					for (int i = 0; i < 256; i++)
						spectrum[i] = data_spectrum[i];
				}
				else  printf("Data Download Error");
			}
			if (SPECTRUM_CH3_spectrum_STOP(&handle) != 0) printf("Stop Error");
		}
	}
	else printf("Start Error");
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_spectrum= 0;
	int32_t Rebin = 0;
	int32_t LimitMode = 0;
	int32_t LimitValue = 0;
	uint32_t data_spectrum[256];
	uint32_t read_data_spectrum;
	uint32_t valid_data_spectrum;
	uint32_t bins = 256;
	int32_t timeout_spectrum = 1000;
	uint32_t spectrum[256];

	if (SPECTRUM_CH4_spectrum_SET_PARAMETERS(Rebin, LimitMode, LimitValue, &handle) != 0) printf("Set Parameters Error");
	if (SPECTRUM_CH4_spectrum_FLUSH(&handle) != 0) printf("Flush Error");
	if (SPECTRUM_CH4_spectrum_RESET(&handle) != 0) printf("Reset Error");
	if (SPECTRUM_CH4_spectrum_START(&handle) == 0) {
		if (SPECTRUM_CH4_spectrum_STATUS(&status_spectrum, &handle) == 0) {
			while (status_spectrum != 0)
			{
				if (SPECTRUM_CH4_spectrum_DOWNLOAD(&data_spectrum, bins, timeout_spectrum, &handle, &read_data_spectrum, &valid_data_spectrum) == 0)
				{
					for (int i = 0; i < 256; i++)
						spectrum[i] = data_spectrum[i];
				}
				else  printf("Data Download Error");
			}
			if (SPECTRUM_CH4_spectrum_STOP(&handle) != 0) printf("Stop Error");
		}
	}
	else printf("Start Error");
*/


	
#else

#endif

	return 0;
}

 