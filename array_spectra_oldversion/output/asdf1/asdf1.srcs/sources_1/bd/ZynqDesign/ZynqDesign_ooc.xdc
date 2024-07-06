################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name CLOCK_PL -period 8 [get_ports CLOCK_PL]
create_clock -name INVALID_EXT_CLK -period 8 [get_ports INVALID_EXT_CLK]
create_clock -name SIRcClock -period 6.400 [get_ports SIRcClock]
create_clock -name GT_REFCLK_0_clk_p -period 6.400 [get_ports GT_REFCLK_0_clk_p]
create_clock -name processing_system7_0_FCLK_CLK0 -period 8 [get_pins processing_system7_0/FCLK_CLK0]

################################################################################