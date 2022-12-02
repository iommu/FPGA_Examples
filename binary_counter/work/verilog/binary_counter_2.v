module binary_counter_2 (
    input clk,  // clock
    input rst_n,            // reset button (active low)
    output [7:0] led      // 8 user controllable LEDs
  );
  
    counter_3   count ( .clk(clk), .rstn(rst_n), .out(led));
  
endmodule