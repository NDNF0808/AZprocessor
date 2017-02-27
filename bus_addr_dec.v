`include "./bush.v"
module bus_addr_dec(input [`DATA_WIDTH] m_addr,//m为master,s为slave
                    output reg  s0_cs, s1_cs, s2_cs, s3_cs, s4_cs, s5_cs, s6_cs, s7_cs
                    );
    reg [2:0]                  INDEX;
    always @ (*)
      begin
          if(m_addr >= 'h00000000 && m_addr <= 'h1FFFFFFF)
            INDEX = 3'd0;
          else if(m_addr >= 'h20000000 && m_addr <= 'h3FFFFFFF)
            INDEX = 3'd1;
          else if(m_addr >= 'h40000000 && m_addr <= 'h5FFFFFFF)
            INDEX = 3'd2;
          else if(m_addr >= 'h60000000 && m_addr <= 'h7FFFFFFF)
            INDEX = 3'd3;
          else if(m_addr >= 'h80000000 && m_addr <= 'h9FFFFFFF)
            INDEX = 3'd4;
          else if(m_addr >= 'hA0000000 && m_addr <= 'hBFFFFFFF)
            INDEX = 3'd5;
          else if(m_addr >= 'hC0000000 && m_addr <= 'hDFFFFFFF)
            INDEX = 3'd6;
          else







            
            INDEX = 3'd7;
      end // always @ begin
    
  /* initial
      begin
          s0_cs = `CS_DISABLE;
          s1_cs = `CS_DISABLE;
          s2_cs = `CS_DISABLE;
          s3_cs = `CS_DISABLE;
          s4_cs = `CS_DISABLE;
          s5_cs = `CS_DISABLE;
          s6_cs = `CS_DISABLE;
          s7_cs = `CS_DISABLE;
      end
   */
  
    always @ (*)
      begin 
          
          case(INDEX)
            0:
                 begin
                     s0_cs = `CS_ENABLE;
                     s1_cs = `CS_DISABLE;
                     s2_cs = `CS_DISABLE;
                     s3_cs = `CS_DISABLE;
                     s4_cs = `CS_DISABLE;
                     s5_cs = `CS_DISABLE;
                     s6_cs = `CS_DISABLE;
                     s7_cs = `CS_DISABLE;
                 end
           1:
                 begin
                     s1_cs = `CS_ENABLE;            
                     s0_cs = `CS_DISABLE;
                     s2_cs = `CS_DISABLE;
                     s3_cs = `CS_DISABLE;
                     s4_cs = `CS_DISABLE;
                     s5_cs = `CS_DISABLE;
                     s6_cs = `CS_DISABLE;
                     s7_cs = `CS_DISABLE;
                 end
            2:
                 begin
                     s2_cs = `CS_ENABLE;
                     s1_cs = `CS_DISABLE;
                     s0_cs = `CS_DISABLE;
                     s3_cs = `CS_DISABLE;
                     s4_cs = `CS_DISABLE;
                     s5_cs = `CS_DISABLE;
                     s6_cs = `CS_DISABLE;
                     s7_cs = `CS_DISABLE;
                 end 
            3:
                 begin
                     s3_cs = `CS_ENABLE;
                     s1_cs = `CS_DISABLE;
                     s2_cs = `CS_DISABLE;
                     s0_cs = `CS_DISABLE;
                     s4_cs = `CS_DISABLE;
                     s5_cs = `CS_DISABLE;
                     s6_cs = `CS_DISABLE;
                     s7_cs = `CS_DISABLE;
                 end 
            4:
                 begin
                     s4_cs = `CS_ENABLE;
                     s1_cs = `CS_DISABLE;
                     s2_cs = `CS_DISABLE;
                     s3_cs = `CS_DISABLE;
                     s0_cs = `CS_DISABLE;
                     s5_cs = `CS_DISABLE;
                     s6_cs = `CS_DISABLE;
                     s7_cs = `CS_DISABLE;
                 end 
            5:
                 begin
                     s5_cs = `CS_ENABLE;
                     s1_cs = `CS_DISABLE;
                     s2_cs = `CS_DISABLE;
                     s3_cs = `CS_DISABLE;
                     s4_cs = `CS_DISABLE;
                     s0_cs = `CS_DISABLE;
                     s6_cs = `CS_DISABLE;
                     s7_cs = `CS_DISABLE;
                 end 
            6:
                 begin
                     s6_cs = `CS_ENABLE;
                     s1_cs = `CS_DISABLE;
                     s2_cs = `CS_DISABLE;
                     s3_cs = `CS_DISABLE;
                     s4_cs = `CS_DISABLE;
                     s5_cs = `CS_DISABLE;
                     s0_cs = `CS_DISABLE;
                     s7_cs = `CS_DISABLE;
                 end 
            7:
                 begin
                     s7_cs = `CS_ENABLE;
                     s1_cs = `CS_DISABLE;
                     s2_cs = `CS_DISABLE;
                     s3_cs = `CS_DISABLE;
                     s4_cs = `CS_DISABLE;
                     s5_cs = `CS_DISABLE;
                     s6_cs = `CS_DISABLE;
                     s0_cs = `CS_DISABLE;
                 end
          endcase // case (m_addr)
      end // always @ begin
endmodule // bus_addr_dec
