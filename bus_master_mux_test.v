
`include "./bus_master_mux.v"
module test;
    reg [`ADDR_WIDTH] m0_addr, m1_addr, m2_addr, m3_addr;//各个主控的输出地址
    reg               m0_rw, m1_rw, m2_rw, m3_rw;
    reg            m0_as, m1_as, m2_as, m3_as;
    reg            m0_grant, m1_grant, m2_grant, m3_grant;
    reg [`DATA_WIDTH] m0_data, m1_data, m2_data, m3_data;
    wire [`ADDR_WIDTH] m_addr;
    wire               m_rw, m_as;
    wire [`DATA_WIDTH] m_data;
    initial
      begin
         
              m0_grant = `GRANT_ENABLE;
              m1_grant = `GRANT_ENABLE;
              m3_grant = `GRANT_ENABLE;
              m2_grant = `GRANT_ENABLE;
              m0_addr = 1;
              m1_addr = 2;
              m2_addr = 3;
              m3_addr = 4;
              m0_data = 1;
              m1_data = 2;
              m2_data = 3;
              m3_data = 4;
              m0_as = `AS_ENABLE;
              m1_as = `AS_ENABLE;
              m2_as = `AS_ENABLE;
              m3_as = `AS_ENABLE;
              m0_rw = `RW_READ;
              m1_rw = `RW_WRITE;
              m2_rw = `RW_WRITE;
              m3_rw = `RW_READ;
          #1000 $finish;
          
      end // initial begin
    always #3 begin
        m0_grant = {$random}%2;
        m1_grant = {$random}%2;
        m2_grant = {$random}%2;
        m3_grant = {$random}%2;
    end
                        bus_master_mux bus ( m0_addr, m1_addr, m2_addr, m3_addr,m0_rw, m1_rw, m2_rw, m3_rw,  m0_as, m1_as, m2_as, m3_as,  m0_grant, m1_grant, m2_grant, m3_grant, m0_data, m1_data, m2_data, m3_data, m_addr,  m_rw, m_as, m_data
                                             );
    initial
      begin
          $dumpfile("bus_master_mux.vcd");
          $dumpvars(0,test);
      end
endmodule // test

          
 
        
          
          
                      