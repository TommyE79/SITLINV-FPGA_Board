//*******************************************************************************/
module top
(
input				sys_clk, 	//200MHZ时钟
//input               rst_n,                      //reset ,low active
//hdmi in
inout               hdmi_ddc_scl_io,            //hdmi input edid scl 
inout               hdmi_ddc_sda_io,            //hdmi input edid data
input               TMDS_clk_hdmi_in_n,         //HDMI input differential clock negative
input               TMDS_clk_hdmi_in_p,         //HDMI input differential clock positive
input[2:0]          TMDS_data_hdmi_in_n,        //HDMI input differential data negative
input[2:0]          TMDS_data_hdmi_in_p,        //HDMI input differential data positive
//hdmi out
output              TMDS_clk_hdmi_out_n,        //HDMI output differential clock negative
output              TMDS_clk_hdmi_out_p,        //HDMI output differential clock positive
output [2:0]        TMDS_data_hdmi_out_n,       //HDMI output differential data negative
output [2:0]        TMDS_data_hdmi_out_p        //HDMI input differential data positive
    );
wire                hdmi_ddc_scl_i;
wire                hdmi_ddc_scl_o;
wire                hdmi_ddc_scl_t;
wire                hdmi_ddc_sda_i;
wire                hdmi_ddc_sda_o;
wire                hdmi_ddc_sda_t;
wire[23:0]          vid_pData;                  //get data from the hdmi input
wire                vid_pVDE;                   //data valid  flag from the hdmi input
wire                vid_pHSync;                 //horizontal synchronization
wire                vid_pVSync;                 //vertical synchronization

reg[23:0]           vid_pData_d0;
reg                 vid_pVDE_d0;
reg                 vid_pHSync_d0;
reg                 vid_pVSync_d0;

reg[23:0]           vid_pData_d1;
reg                 vid_pVDE_d1;
reg                 vid_pHSync_d1;
reg                 vid_pVSync_d1;

wire 				clk_200m;

wire                PixelClk;                   //Pixel clock
wire                peripheral_aresetn;         // reset
wire                SerialClk;                  //5x PixelClk 
  
wire                aPixelClkLckd;              //clock locked high is active
	  
  video_pll video_pll_0
   (
    .clk_out1	(clk_200m),    
    .resetn		(1'd1), 
    .locked		(locked),      
    .clk_in1	(sys_clk)); 
	
/*************************************************************************
call IOBUF conversion
****************************************************************************/
IOBUF hdmi_ddc_scl_iobuf
(
.I                  (hdmi_ddc_scl_o         ),
.IO                 (hdmi_ddc_scl_io        ),
.O                  (hdmi_ddc_scl_i         ),
.T                  (hdmi_ddc_scl_t         )
);
IOBUF hdmi_ddc_sda_iobuf
(
.I                  (hdmi_ddc_sda_o         ),
.IO                 (hdmi_ddc_sda_io        ),
.O                  (hdmi_ddc_sda_i         ),
.T                  (hdmi_ddc_sda_t         )
); 
/*************************************************************************
Call the third-party dvi2rgb module
****************************************************************************/
dvi2rgb
#(
.kEmulateDDC        (1'b1                   ),
.kRstActiveHigh     (1'b0                   ),
.kAddBUFG           (1'b1                   ),
.kClkRange          (1                      ),
.kEdidFileName      ("dgl_1080p_cea.data"   ),
.kIDLY_TapValuePs   (78                     ),
.kIDLY_TapWidth     (5                      )
)
dvi2rgb_m0
(
.TMDS_Clk_p         (TMDS_clk_hdmi_in_p     ),
.TMDS_Clk_n         (TMDS_clk_hdmi_in_n     ),
.TMDS_Data_p        (TMDS_data_hdmi_in_p    ),
.TMDS_Data_n        (TMDS_data_hdmi_in_n    ),

.RefClk             (clk_200m             	),
.aRst               (1'b0                   ),
.aRst_n             (locked                  ),

.vid_pData          (vid_pData              ),
.vid_pVDE           (vid_pVDE               ), 
.vid_pHSync         (vid_pHSync             ), 
.vid_pVSync         (vid_pVSync             ), 
.PixelClk           (PixelClk               ),

.SerialClk          (SerialClk              ),
.aPixelClkLckd      (aPixelClkLckd          ),

.SDA_I          (hdmi_ddc_sda_i         ),
.SDA_O          (hdmi_ddc_sda_o         ), 
.SDA_T          (hdmi_ddc_sda_t         ), 
.SCL_I          (hdmi_ddc_scl_i         ),
.SCL_O          (hdmi_ddc_scl_o         ),  
.SCL_T          (hdmi_ddc_scl_t         ), 

.pRst               (1'b0                   ),
.pRst_n             (locked                  )
);

/*************************************************************************
Data delay 
****************************************************************************/
always@(posedge PixelClk)
begin
    vid_pData_d0    <=  vid_pData;
    vid_pVDE_d0     <=  vid_pVDE;
    vid_pHSync_d0   <=  vid_pHSync;
    vid_pVSync_d0   <=  vid_pVSync;
    vid_pData_d1    <=  vid_pData_d0;
    vid_pVDE_d1     <=  vid_pVDE_d0;
    vid_pHSync_d1   <=  vid_pHSync_d0;
    vid_pVSync_d1   <=  vid_pVSync_d0;
end  
       
/*************************************************************************
Call the third-party rgb2dvi module
****************************************************************************/
rgb2dvi
#(
.kGenerateSerialClkv(1'b1                   ),
.kClkRange          (1                      ),     
.kRstActiveHigh     (1'b1                   )
)
rgb2dvi_m0 
(
// DVI 1.0 TMDS video interface
.TMDS_Clk_p         (TMDS_clk_hdmi_out_p    ),
.TMDS_Clk_n         (TMDS_clk_hdmi_out_n    ),
.TMDS_Data_p        (TMDS_data_hdmi_out_p   ),
.TMDS_Data_n        (TMDS_data_hdmi_out_n   ),  
//Auxiliary signals 
.aRst               (1'b0                   ),  //asynchronous reset; must be reset when RefClk is not within spec
.aRst_n             (locked                  ),  //-asynchronous reset; must be reset when RefClk is not within spec
// Video in
.vid_pData          (vid_pData_d1           ),
.vid_pVDE           (vid_pVDE_d1            ),
.vid_pHSync         (vid_pHSync_d1          ),
.vid_pVSync         (vid_pVSync_d1          ),
.PixelClk           (PixelClk               ),
.SerialClk          (SerialClk              )   // 5x PixelClk
); 
endmodule

