`include "./bush.v"
module bus_master_mux(input [`ADDR_WIDTH] m0_addr, m1_addr, m2_addr, m3_addr,//各个主控的输出地址
                     input m0_rw, m1_rw, m2_rw, m3_rw,                       //各个主控的读写信号
                      input m0_as, m1_as, m2_as, m3_as, //各个主控的选通信号有效
                      input m0_grant, m1_grant, m2_grant, m3_grant,    //各个主控的获权信号
                      input [`DATA_WIDTH]  m0_data, m1_data, m2_data, m3_data,
                      output reg [`ADDR_WIDTH] m_addr,
                      output    reg           m_rw, m_as,
                      output reg [`DATA_WIDTH] m_data
                      );
    always @ (*)
      begin
          if (m0_grant == `GRANT_ENABLE)
            begin
                m_addr = m0_addr;
                m_data = m0_data;
                m_as = m0_as;
                m_rw = m0_rw;
            end
          else if (m1_grant == `GRANT_ENABLE) 
            begin
                m_addr = m1_addr;
                m_data = m1_data;
                m_as = m1_as;
                m_rw = m1_rw;
            end
          else if (m2_grant == `GRANT_ENABLE)
            begin
                m_addr = m2_addr;
                m_data = m2_data;
                m_as = m2_as;
                m_rw = m2_rw;
            end
          else if (m3_grant == `GRANT_ENABLE)
            begin
                m_addr = m3_addr;
                m_data = m3_data;
                m_as = m3_as;
                m_rw = m3_rw;
            end
          else
            begin
                m_addr = `MADDR_DEFAULT;
                m_data = `MDATA_DEFAULT;
                m_as = `AS_DISABLE;
                m_rw = `RW_READ;
            end // else: !if(m3_grant == `GRANT_ENABLE)
      end // always @ (*)
endmodule // bus_master_mux



                
    