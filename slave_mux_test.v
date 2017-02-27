`include "./slave_mux.v"
module test;
    reg  s0_cs, s1_cs, s2_cs, s3_cs, s4_cs, s5_cs, s6_cs, s7_cs, s0_ready, s1_ready,  s2_ready, s3_ready, s4_ready, s5_ready, s6_ready, s7_ready;
    reg [`DATA_WIDTH] s0_rd_data, s1_rd_data, s2_rd_data, s3_rd_data, s4_rd_data, s5_rd_data, s6_rd_data,s7_rd_data;
    wire [`DATA_WIDTH] s_rd_data;
    wire              s_ready;
initial
  begin
      #0 begin
          s0_cs = `CS_ENABLE;
          s1_cs = `CS_DISABLE;
          s2_cs= `CS_DISABLE;
          s3_cs = `CS_DISABLE;
          s4_cs= `CS_DISABLE;
          s5_cs = `CS_DISABLE;
          s6_cs = `CS_DISABLE;
          s7_cs = `CS_DISABLE;
          s0_ready = `HIGH;
          s1_ready = `HIGH;
          s2_ready = `HIGH;
          s3_ready = `HIGH;
          s4_ready = `HIGH;
          s5_ready = `HIGH;
          s6_ready = `HIGH;
          s7_ready = `HIGH;
          s0_rd_data = 'd1;
          s1_rd_data = 'd2;
          s2_rd_data = 'd3;
          s3_rd_data = 'd4;
          s4_rd_data = 'd5;
          s5_rd_data = 'd6;
          s6_rd_data = 'd7;
          s7_rd_data = 'd8;
      end 
      
      #1000
        $finish;
      
      
     end 
always #2 begin
    s0_ready = {$random} % 2;
    s1_ready = {$random} % 2;
    s2_ready = {$random} % 2;
    s3_ready = {$random} % 2;
    s4_ready = {$random} % 2;
    s5_ready = {$random} % 2;
    s6_ready = {$random} % 2;
    s7_ready = {$random} % 2;
    s0_cs = {$random} % 2;
    s1_cs = {$random} % 2;
    s2_cs = {$random} % 2;
    s3_cs = {$random} % 2;
    s4_cs = {$random} % 2;
    s5_cs = {$random} % 2;
    s6_cs = {$random} % 2;
    s7_cs = {$random} % 2;
    s0_rd_data = {$random} % 4294967296;
    s1_rd_data = {$random} % 4294967296;
    s2_rd_data = {$random} % 4294967296;
    s3_rd_data = {$random} % 4294967296;
    s4_rd_data = {$random} % 4294967296;
    s5_rd_data = {$random} % 4294967296;
    s6_rd_data = {$random} % 4294967296;
    s7_rd_data = {$random} % 4294967296;
end // always #2
    slave_mux a(  s0_cs, s1_cs, s2_cs, s3_cs, s4_cs, s5_cs, s6_cs, s7_cs, s0_ready, s1_ready,  s2_ready, s3_ready, s4_ready, s5_ready, s6_ready, s7_ready, s0_rd_data, s1_rd_data, s2_rd_data, s3_rd_data, s4_rd_data, s5_rd_data, s6_rd_data,s7_rd_data,s_rd_data,s_ready  );
    initial
      begin
          $dumpfile("slave_mux.vcd");
          $dumpvars(0,test);
      end
    
endmodule // test
