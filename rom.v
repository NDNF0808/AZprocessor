/********************只读存储器ROM的实现片选０　号**********************/
`include "./bush.v"
module rom(input clk, reset, s0_cs, m_as,
           input [`ROM_ADDR_WIDTH] rom_addr,
           output [`DATA_WIDTH] s0_rd_data,
           output reg s0_ready
           ) ;
    reg           resetn, a1;
    /****************异步复位同步释放*******************************/
    
   always @ (posedge clk, `RESET_EDGE reset)
     begin
         if (reset == `RESET_ENABLE)
           begin
               resetn = #1 1'b0;
               a1 =  #1 1'b0;
           end
         else
           a1 = #1 1'b1;
         resetn = #1 a1;
     end // always @ (posedge clk, `RESET_EDGE reset)
    /**********************输出Ｒ０——ｒｅａｄｙ***********************/
    always @ (posedge clk, `RESET_EDGE resetn)
      begin
          if (resetn == `RESET_ENABLE)
            begin
                s0_ready <= #1 `READY_DISABLE;
            end
          else
            begin
                if(s0_cs == `CS_ENABLE && m_as == `AS_ENABLE)
                  s0_ready <= #1 `READY_ENABLE;
                else
                  s0_ready <= #1 `READY_DISABLE;
            end // else: !if(resetn == `RESET_ENABLE)
      end // always @ (posedge clk, `RESET_EDGE resetn)
    /*************************调用single port RAM模块实现ＲＯＭ*********************************/
  /*  x_s3e_sprom x_s3e_sprom(.clk(clk),
                            .addra(rom_addr),
                            .douta(s0_rd_data);
   */
    reg [`DATA_WIDTH] ROM [2**11-1:0];
    initial
      begin
          $readmemh("ROM.txt",ROM,0,16);
      end
    assign #1 s0_rd_data = (rom_addr!=0)? ROM[rom_addr]:0;
endmodule // rom

    
           