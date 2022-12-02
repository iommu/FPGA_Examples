module counter_3 (  input clk,               // Declare input port for clock to allow counter to count up
    input rstn,              // Declare input port for reset to allow the counter to be reset to 0 when required
    output reg[7:0] out);    // Declare 4-bit output port to get the counter values
  
  // storage for last value
  reg fresh;
 initial fresh = 1;
  
  // This always block will be triggered at the rising edge of clk (0->1)
  // Once inside this block, it checks if the reset is 0, if yes then change out to zero
  // If reset is 1, then design should be allowed to count up, so increment counter
  always @ (posedge clk) begin
    if (rstn && fresh) begin
      out <= out + 1;
      fresh = 0;
    end else if (!rstn && !fresh) begin
      fresh = 1;
      end  
  end
  
  
endmodule