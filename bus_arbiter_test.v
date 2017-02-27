`timescale 1ns/1ps
`include "./bus_arbiter.v"
module test;
    reg  m0_req, m1_req, m2_req, m3_req,clk, reset;
    wire m0_grant, m1_grant, m2_grant, m3_grant;
    initial
      begin
          #0 begin
              clk <= `LOW;
              reset <= `RESET_DISABLE;
              m0_req <= `REQ_ENABLE;
              m1_req <= `REQ_ENABLE;
              m2_req <= `REQ_ENABLE;
              m3_req <= `REQ_ENABLE;
          end
          #1 reset <= ~reset;//注意ｒｅｓｅｔ置为有效信号后必须再把它置为无效
          #1 reset <= ~reset;
          
          #1000
            $finish;
          

      end // initial begin
    always #1  begin
         clk <= ~clk;
    end
    always #6 begin
       
            m0_req <= {$random} % 2;
            m1_req <= {$random} % 2;
            m2_req <= {$random} % 2;
            m3_req <= {$random} % 2;
        end

    
    bus_arbiter bus (  m0_req, m1_req, m2_req, m3_req,clk, reset, m0_grant, m1_grant, m2_grant, m3_grant);
    initial
      begin
          $dumpfile ("bus_arbiter.vcd");
          $dumpvars(0,test);
      end
endmodule // test

    
        
              
              
              

          
                  


    