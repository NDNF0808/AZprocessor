`include "./bush.v"
module slave_mux(input s0_cs, s1_cs, s2_cs, s3_cs, s4_cs, s5_cs, s6_cs, s7_cs, s0_ready, s1_ready,  s2_ready, s3_ready, s4_ready, s5_ready, s6_ready, s7_ready, 
                 input [`DATA_WIDTH]  s0_rd_data, s1_rd_data, s2_rd_data, s3_rd_data, s4_rd_data, s5_rd_data, s6_rd_data,s7_rd_data,
                 output reg [`DATA_WIDTH] s_rd_data,
                 output    reg           s_ready);
    always @ (*)
      begin
          if(s0_cs == `CS_ENABLE)
            begin
                s_rd_data = s0_rd_data;
                s_ready = s0_ready;
            end
          else if(s1_cs == `CS_ENABLE)
            begin
                s_rd_data = s1_rd_data;
                s_ready = s1_ready;
            end
          else if(s2_cs == `CS_ENABLE)
            begin
                s_rd_data = s2_rd_data;
                s_ready = s2_ready;
            end
          else if(s3_cs == `CS_ENABLE)
            begin
                s_rd_data = s3_rd_data;
                s_ready = s3_ready;
            end
          else if(s4_cs == `CS_ENABLE)
            begin
                s_rd_data = s4_rd_data;
                s_ready = s4_ready;
            end
          else if(s5_cs == `CS_ENABLE)
            begin
                s_rd_data = s5_rd_data;
                s_ready = s5_ready;
            end
          else if(s6_cs == `CS_ENABLE)
            begin
                s_rd_data = s6_rd_data;
                s_ready = s6_ready;
            end
          else if(s7_cs == `CS_ENABLE)
            begin
                s_rd_data = s7_rd_data;
                s_ready = s7_ready;
            end
          else
            begin
                s_rd_data = 'd0;
                s_ready = `LOW;
            end
      end // always @ (*)
endmodule // slave_mux



                