-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Thu Aug 11 11:52:35 2022
-- Host        : DESKTOP-DTL1MCC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top design_3_util_ds_buf_0_0 -prefix
--               design_3_util_ds_buf_0_0_ design_2_util_ds_buf_0_0_stub.vhdl
-- Design      : design_2_util_ds_buf_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_3_util_ds_buf_0_0 is
  Port ( 
    BUFG_I : in STD_LOGIC_VECTOR ( 0 to 0 );
    BUFG_O : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end design_3_util_ds_buf_0_0;

architecture stub of design_3_util_ds_buf_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "BUFG_I[0:0],BUFG_O[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "util_ds_buf,Vivado 2022.1";
begin
end;
