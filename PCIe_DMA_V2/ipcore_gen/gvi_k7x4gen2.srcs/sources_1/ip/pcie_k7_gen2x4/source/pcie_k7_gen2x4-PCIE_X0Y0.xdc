##-----------------------------------------------------------------------------
##
## (c) Copyright 2010-2011 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.
##
##-----------------------------------------------------------------------------
## Project    : Series-7 Integrated Block for PCI Express
## File       : pcie_k7_gen2x4-PCIE_X0Y0.xdc
## Version    : 3.0
#
###############################################################################
# User Time Names / User Time Groups / Time Specs
###############################################################################

###############################################################################
# User Physical Constraints
###############################################################################


###############################################################################
# Pinout and Related I/O Constraints
###############################################################################


###############################################################################
# Physical Constraints
###############################################################################
#
# Transceiver instance placement.  This constraint selects the
# transceivers to be used, which also dictates the pinout for the
# transmit and receive differential pairs.  Please refer to the
# Virtex-7 GT Transceiver User Guide (UG) for more information.
#

# PCIe Lane 0
set_property LOC GTXE2_CHANNEL_X0Y7 [get_cells {inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
# PCIe Lane 1
set_property LOC GTXE2_CHANNEL_X0Y6 [get_cells {inst/gt_top_i/pipe_wrapper_i/pipe_lane[1].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
# PCIe Lane 2
set_property LOC GTXE2_CHANNEL_X0Y5 [get_cells {inst/gt_top_i/pipe_wrapper_i/pipe_lane[2].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
# PCIe Lane 3
set_property LOC GTXE2_CHANNEL_X0Y4 [get_cells {inst/gt_top_i/pipe_wrapper_i/pipe_lane[3].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]


#
# PCI Express Block placement. This constraint selects the PCI Express
# Block to be used.
#

set_property LOC PCIE_X0Y0 [get_cells inst/pcie_top_i/pcie_7x_i/pcie_block_i]

#
# BlockRAM placement
#
set_property LOC RAMB36_X5Y35 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[7].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X5Y36 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[6].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X5Y27 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[5].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X5Y28 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[6].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X5Y29 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[7].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X4Y37 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[5].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X4Y36 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[4].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X4Y35 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[3].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X4Y34 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[2].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X4Y33 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[1].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X4Y32 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_rx/brams[0].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X4Y31 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[0].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X4Y30 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[1].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X4Y29 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[2].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X4Y28 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[3].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]
set_property LOC RAMB36_X4Y27 [get_cells {inst/pcie_top_i/pcie_7x_i/pcie_bram_top/pcie_brams_tx/brams[4].ram/use_tdp.ramb36/ramb_bl.ramb36_dp_bl.ram36_bl}]

###############################################################################
# Timing Constraints
###############################################################################
#
create_clock -period 10 [get_pins {inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtx_channel.gtxe2_channel_i/TXOUTCLK}]
#
#
set_false_path -through [get_pins {inst/pcie_top_i/pcie_7x_i/pcie_block_i/PLPHYLNKUPN}]
set_false_path -through [get_pins {inst/pcie_top_i/pcie_7x_i/pcie_block_i/PLRECEIVEDHOTRST}]

###############################################################################
# End
###############################################################################
