           module top(input clk, reset, m0_req, m1_req,m2_req, m3_req,
                      input [`ADDR_WIDTH] m0_addr, m1_addr, m2_addr, m3_addr,
                      input               m0_rw, m1_rw, m2_rw, m3_rw, 
                      input               m0_as, m1_as, m2_as, m3_as,
                      input [`DATA_WIDTH] m0_data, m1_data, m2_data, m3_data,
                      input               s0_ready, s1_ready, s2_ready, s3_ready, s4_ready, s5_ready, s6_ready, s7_ready,
                      input [`DATA_WIDTH] s0_rd_data, s1_rd_data, s2_rd_data, s3_rd_data, s4_rd_data, s5_rd_data, s6_rd_data,s7_rd_data,


);
    wire m0_grant, m1_grant, m2_grant, m3_grant;
    wire [`ADDR_WIDTH] m_addr;
    wire               m_rw, m_as;
    wire [`DATA_WIDTH] m_data;
    wire               s0_cs, s1_cs, s2_cs, s3_cs, s4_cs, s5_cs, s6_cs, s7_cs;
    wire [`DATA_WIDTH] s_rd_data;
    wire               s_ready;


    

    


    
    bus_arbiter bus_arbiter(m0_req, m1_req, m2_req, m3_req,clk, reset,m0_grant, m1_grant, m2_grant, m3_grant );
 
    bus_master_mux bus_master_mux( m0_addr, m1_addr, m2_addr, m3_addr,  m0_rw, m1_rw, m2_rw, m3_rw,  m0_as, m1_as, m2_as, m3_as, m0_grant, m1_grant, m2_grant, m3_grant,  m0_data, m1_data, m2_data, m3_data, m_addr, m_rw, m_as,m_data
                   );
    bus_addr_dec bus_addr_dec( m_addr,s0_cs, s1_cs, s2_cs, s3_cs, s4_cs, s5_cs, s6_cs, s7_cs);
    
    slave_mux slave_mux( s0_cs, s1_cs, s2_cs, s3_cs, s4_cs, s5_cs, s6_cs, s7_cs, s0_ready, s1_ready,  s2_ready, s3_ready, s4_ready, s5_ready, s6_ready, s7_ready, s0_rd_data, s1_rd_data, s2_rd_data, s3_rd_data, s4_rd_data, s5_rd_data, s6_rd_data,s7_rd_data, s_rd_data, s_ready);
