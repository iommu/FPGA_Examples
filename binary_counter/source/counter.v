module counter (  input clk,               // Declare input port for clock to allow counter to count up
    input rstn,              // Declare input port for reset to allow the counter to be reset to 0 when required
    output reg[7:0] out);    // Declare 4-bit output port to get the counter values
  
  // storage for last value
  reg fresh;
 initial fresh = 1;
  
   // clock 0->1
  always @ (posedge clk) begin
    // if reset pressed and is fresh
    if (rstn && fresh) begin
      out <= out + 1;
      fresh = 0; // unset fresh
    end 
    // if reset depressed and fresh unset
    else if (!rstn && !fresh) begin
      fresh = 1; // set fresh
    end    
  end
  
endmodule