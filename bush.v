/**********************总线宏**********************/
`timescale 1ns/1ps
`define RESET_ENABLE 1'b0
`define RESET_DISABLE 1'b1//reset 信号无效
`define RESET_EDGE negedge//ｒｅｓｅｔ信号起作用
`define STATE_WIDTH 1:0//有限状态机实现仲裁
`define REQ_ENABLE 1'b1
`define REQ_DISABLE 1'b0
`define GRANT_ENABLE 1'b1
`define GRANT_DISABLE 1'b0
`define ADDR_WIDTH 29:0//访问存储器地址宽度
`define HIGH 1'b1//默认高电平
`define LOW 1'b0//默认低电平
`define DATA_WIDTH 31:0//存储器输出数据宽度
`define AS_ENABLE 1'b1//选通信号有效
`define AS_DISABLE 1'b0//选通信号无效
`define MDATA_DEFAULT 32'b0//主控复用器输出的默认数据值
`define MADDR_DEFAULT 30'b0//主控复用器输出的默认地址值
`define RW_READ 1'b1//RW信号，为１时读，为０时写
`define RW_WRITE 1'b0
`define CS_ENABLE 1'b1//片选信号有效
`define CS_DISABLE 1'b0//片选信号无效
`define ROM_ADDR_WIDTH 10:0
`define READY_ENABLE 1'b1
`define READY_DISABLE 1'b0
/******************ｃｐｕ宏*************************************/
/*************寄存器组*********************/
`define REG_WIDTH 4:0
`define REG_DATAWIDTH 31:0
`define WRITE_ENABLE 1'b1