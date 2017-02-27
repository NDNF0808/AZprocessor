`include "./bush.v"
module bus_arbiter( input m0_req, m1_req, m2_req, m3_req,clk, reset,
                    output reg m0_grant, m1_grant, m2_grant, m3_grant
                    );
    /********************初始化（无人获得总线控制权）***********************************************/
    initial
      begin
          m0_grant <= `GRANT_DISABLE;
          m1_grant <= `GRANT_DISABLE;
          m2_grant <= `GRANT_DISABLE;
          m3_grant <= `GRANT_DISABLE;

      end 
    /*********************利用有限状态机实现控制*******************/
    reg [`STATE_WIDTH]     state, nextstate;
    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    /**************状态寄存器(使用异步复位同步释放)******************/
    reg                    resetn, a1;
    
    always @ (posedge clk,`RESET_EDGE reset)//ａｌｗａｙｓ同时执行，准确说是所有的信号均是延时相同
      begin
          if(reset == `RESET_ENABLE)//中的两个信号同时赋值，延时相同
            begin
                a1 <= #1 1'b0;
                resetn <= #1 1'b0;
            end
          else
            begin
                a1 <= #1 1'b1;
                resetn <= #1 a1;
            end
      end // always @ (posedge clk,`RESET_EDGE reset)
    always @ (posedge clk,`RESET_EDGE resetn)
      begin
          if (resetn == `RESET_ENABLE)
            state <= #1 s0;
          else
            state <= #1 nextstate;
      end
    /*************下一状态逻辑************************/
    always @ (*)
      begin
          case (state)
            s0: begin 
                if(m0_req == `REQ_ENABLE)
                  nextstate <= s0;
                else if(m1_req == `REQ_ENABLE)
                  nextstate <= s1;
                else if(m2_req == `REQ_ENABLE)
                  nextstate <= s2;
                else if(m3_req == `REQ_ENABLE)
                  nextstate <= s3;
                else
                  nextstate <= s0;
            end
            s1: begin
                if(m1_req == `REQ_ENABLE)
                  nextstate <= s1;
                else if(m2_req == `REQ_ENABLE)
                  nextstate <= s2;
                else if(m3_req == `REQ_ENABLE)
                  nextstate <= s3;
                else if(m0_req == `REQ_ENABLE)
                  nextstate <= s0;
                else
                  nextstate <= s1;
            end
            s2: begin
                if(m2_req == `REQ_ENABLE)
                  nextstate <= s2;
                else if(m3_req == `REQ_ENABLE)
                  nextstate <= s3;
                else if(m0_req == `REQ_ENABLE)
                  nextstate <= s0;
                 else if(m1_req == `REQ_ENABLE)
                  nextstate <= s1;
                else
                  nextstate <= s2;
            end
            s3: begin
                if(m3_req == `REQ_ENABLE)
                  nextstate <= s3;
                else if(m0_req == `REQ_ENABLE)
                  nextstate <= s0;
                else if(m1_req == `REQ_ENABLE)
                  nextstate <= s1;
                else if(m2_req == `REQ_ENABLE)
                  nextstate <= s2;
                else
                  nextstate <= s3;
            end // case: s3
          endcase // case (state)
          end // always @ (*)
    /***************输出逻辑****************************/
    always @ (*)
    begin
        case (state)//输出中应包含所有的输出项，否则就会保持原输出
          s0: begin
              m0_grant <= `GRANT_ENABLE;
              m1_grant <= `GRANT_DISABLE;
              m2_grant <= `GRANT_DISABLE;
              m3_grant <= `GRANT_DISABLE;
              end 
          s1: begin
              m1_grant <= `GRANT_ENABLE;
              m0_grant <= `GRANT_DISABLE;
              m2_grant <= `GRANT_DISABLE;
              m3_grant <= `GRANT_DISABLE;
              end 
          s2:begin
              m2_grant <= `GRANT_ENABLE;
              m1_grant <= `GRANT_DISABLE;
              m0_grant <= `GRANT_DISABLE;
              m3_grant <= `GRANT_DISABLE;
          end 
          s3:begin
              m3_grant <= `GRANT_ENABLE;
              m1_grant <= `GRANT_DISABLE;
              m0_grant <= `GRANT_DISABLE;
              m2_grant <= `GRANT_DISABLE;
          end 
        endcase // case (state)
    end
endmodule // bus_arbiter

    

                
            
            
            
            
    
            