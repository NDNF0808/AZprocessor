`include "./rom.v"
module test;
    reg clk, reset, s0_cs, m_as;
    reg [`ROM_ADDR_WIDTH] rom_addr;
    wire [`DATA_WIDTH]    s0_rd_data;
    wire                  s0_ready;
    initial
      begin
          #0 begin
              clk = `LOW;
              reset = `RESET_DISABLE;
              s0_cs = `CS_ENABLE;
              m_as = `AS_ENABLE;
              rom_addr = 'd6;
              
          end
          #1 reset = ~reset;
          #1 reset = ~reset;
          #1000
            $finish;
      end // initial begin
    always #1  begin
        clk = ~clk;
        #2 begin
            s0_cs = {$random}%2;
            m_as = {$random}%2;
        end
    end
    rom rom(clk, reset,s0_cs, m_as,rom_addr,s0_rd_data,s0_ready);
    initial
      begin
          $dumpfile("rom.vcd");
          $dumpvars(0,test);
      end
endmodule // test

    
        

    