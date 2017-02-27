`include "./bus_addr_dec.v"
module test;
    reg [`DATA_WIDTH] m_addr;
    wire              s0_cs, s1_cs, s2_cs, s3_cs, s4_cs, s5_cs, s6_cs, s7_cs;
    initial
      begin
          m_addr = 'd256;
          #1000 $finish;
      end
    always #2 begin
        m_addr = {$random}%4294967296;
    end
    bus_addr_dec bus(m_addr,s0_cs,s1_cs, s2_cs, s3_cs, s4_cs, s5_cs, s6_cs, s7_cs);
    initial
      begin
          $dumpfile("bus_addr_dec.vcd");
          $dumpvars(0,test);
      end
endmodule // test

         
          

    

