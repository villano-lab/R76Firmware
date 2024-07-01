#Firmware Overview

Below is an overview of R76Firmware -- its inputs, outputs, and capabilities. 
This document does not cover any associated software and is intended more for
development.

**This document is a first draft and needs to be verified.**

![../R76Firmware.jpg](An diagram of R76Firmware generated automatically by SCI-Compiler.)

## Inputs
Several inputs are register files, numbered from 0 to 32. In these cases, the number corresponds to an analog pin -- that is, each number corresponds to one NaI detector. Since analog pins 23-31 are presently unused, these values are placeholders and do not have any effect on the firmware or its output.

__Analog Pins A0 - A22:__ Analog input from the NaI array, one for each present detector.
__base:__ Register file. Each has an integer value corresponding to the baseline in ADC units. This baseline is used by the ChargeIntegrator subdiagram as the zero point for integration if manual_base is set to 1.
__disable_det:__ Register file. Each has a binary value; 1 disables the detector for the purpose of triggering, and 0 leaves it enabled.
__gate_l:__ Integer. Clock ticks to gate lower trigger. This is done to ensure the trigger data is held long enough to align with other internal checks.
__gate_u:__ Integer. Clock ticks to gate upper trigger. This is done to ensure the upper trigger always wholly includes the lower trigger; gate_u must be larger than gate_l or the trigger will malfunction.
__inhib:__ Integer. Clock ticks post-trigger to prevent another lower trigger from going off. Does not affect upper trigger.
__polarity:__ Binary. If 1, the firmware will trigger on rising edge, and if 0, the firmware will trigger on falling edge.
__skip:__ Integer. 

__thrsh:__ Register file. Each has an integer value corresponding to the lower threshold in ADC units. Impulses that do **not** exceed this value on the corresponding detector do **not** trigger.
__top:__ Register file. Each has an integer value corresponding to the upper threshold in ADC units. Impulses that **do** exceed this value on the corresponding detector do **not** trigger.
