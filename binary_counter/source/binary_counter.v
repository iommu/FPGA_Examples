module binary_counter (
    input clk,  // clock
    input rst_n,            // reset button (active low)
    output [7:0] led      // 8 user controllable LEDs
  );
  
    counter   count ( .clk(clk), .rstn(rst_n), .out(led));
  
endmodule