module counter (  input clk,               // Declare input port for clock to allow counter to count up
    input rstn,              // Declare input port for reset to allow the counter to be reset to 0 when required
    output reg[7:0] out);    // Declare 4-bit output port to get the counter values
  
  wire button, button_down, button_up;
  debounce debounce(.clk(clk), .button(rstn), .button_down(button_down), .button_up(button_up));
  
  // clock 0->1
  always @ (posedge clk) begin
    // if reset pressed and is fresh
    if (button_down) begin
      out <= out + 1;
    end
  end
endmodule
