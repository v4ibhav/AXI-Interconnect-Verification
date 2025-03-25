module tb;
    localparam ADDR_WIDTH = 16;


    bit clk;
    bit reset;
    
    //clk logic
    always #10 clk = ~clk;



    //initiating 
    taxi_axi_if #(
        .ADDR_W(ADDR_WIDTH)
        )
    axi_if();

    taxi_axi_ram #(
        .ADDR_W(ADDR_WIDTH)
    ) axi_ram(
        clk,
        reset,
        axi_if.wr_slv,
        axi_if.rd_slv
    );

    //basic reset
    initial begin: resetting
       reset = 1; 

       #10 @(posedge clk) reset = 0;
       @(posedge clk) reset = 1;

       #1000 $finish;
    end


    
        

endmodule