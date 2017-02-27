module gpr(input clk,  we,
           input [`REGWIDTH] rd_addr0, rd_addr1, wr_addr,
           input [`REG_DATAWIDTH] wr_data,
           output[`REG_DATAWIDTH]rd_data0, rd_data1
           );
    reg [`REG_DATAWIDTH]          regfile [`REGWIDTH];
    
    assign rd_data0 = (rd_addr0 != 1'b0) ?  regfile[rd_addr0] : 0;
    assign rd_data1 = (rd_addr1 != 1'b0) ?  regfile[rd_addr1] : 0;
    always @ (negedge clk)
      begin
          if (we == `WRITE_ENABLE)
            regfile[wr_addr] <= wr_data;
      end
endmodule // gpr
