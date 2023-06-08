/*----------------------------------------------------------------------------
 * Copyright (c) 2011 Xilinx, Inc.
 * This design is confidential and proprietary of Xilinx, All Rights Reserved.
 *-----------------------------------------------------------------------------
 *   ____  ____
 *  /   /\/   /
 * /___/  \  /   Vendor: Xilinx
 * \   \   \/    Date Created: 2011/04/26
 *  \   \        
 *  /   /        
 * /___/   /\    
 * \   \  /  \ 
 *  \___\/\___\
 * 
 *Device: All
 *Purpose:
 *  General functions used by other Labtools IP cores. Functions will
 *  be added as needed.
 *
 *Notes:
 *  Include the file inside the Verilog module after the module and port
 *  section. Do not include at the top of the module.  
 *
 *----------------------------------------------------------------------------*/

  function integer clogb2;
    input integer depth;
    integer d;
    begin 
      if (depth == 0)
        clogb2 = 1;
      else
      begin
        d = depth;
        for (clogb2=0; d > 0; clogb2 = clogb2+1)
          d = d >> 1;
      end
    end 
  endfunction  


