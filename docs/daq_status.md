The purpose of this document is to have up-to-date information on the status of the DAQ system, including hardware, firmware, and software. **ALL status information should contain a date noting when the status was last updated.**

**DCRCs:** [15 Dec '23] DCRC was reconnected after warmup, turned on, and connected to diverter board, BNC, and triggering setup. One DCRC is available at `...164`. `rt` command over telnet returns all zeroes.
**NaI Array:** [15 Dec '23] Working, via tests independent of DCRCs. `./currentrate`, run without changing anything from DCRC tests, gives O~0.1 Hz, inconsistent with lack of triggers shown in DCRCs.
**MIDAS DAQ:** [15 Dec '23] Unaltered from previous runs.
