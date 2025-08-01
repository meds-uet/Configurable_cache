`timescale 1ns/1ps

module cache_decoder_tb;

    
    logic clk;
    logic [31:0] address;
    logic [23:0] tag;
    logic [5:0] index;
    logic [1:0] blk_offset;

    
    cache_decoder uut (
        .clk(clk),
        .address(address),
        .tag(tag),
        .index(index),
        .blk_offset(blk_offset)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    initial begin
        
        address = 32'b0;

        // Allow settling
        #12;

        
        address = 32'b11011110101011011011111011101111;

        
        @(posedge clk);

        // Display outputs for manual checking
        $display("Address = %b", address);
        $display("Tag     = %b", tag);
        $display("Index   = %b", index);
        $display("BlkOff  = %b", blk_offset);

        #10;
        $finish;
    end

endmodule