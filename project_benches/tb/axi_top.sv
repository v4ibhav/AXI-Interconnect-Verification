module axi_top;
  bit aclk;
  bit aresetn;

  initial begin
    aclk = 0;
    forever #5 aclk = ~aclk;
  end
endmodule
