// https://www.fpga4fun.com/Debouncer2.html
module debounce(
    input clk,
    input button,  // "PB" is the glitchy, asynchronous to clk, active low push-button signal
    
    // from which we make three outputs, all synchronous to the clock
    output reg button_state,  // 1 as long as the push-button is active (down)
    output button_down,  // 1 for one clock cycle when the push-button goes down (i.e. just pushed)
    output button_up   // 1 for one clock cycle when the push-button goes up (i.e. just released)
  );
  
  // First use two flip-flops to synchronize the PB signal the "clk" clock domain
  reg button_sync_0;  always @(posedge clk) button_sync_0 <= ~button;  // invert PB to make PB_sync_0 active high
  reg button_sync_1;  always @(posedge clk) button_sync_1 <= button_sync_0;
  
  // Next declare a 16-bits counter
  reg [15:0] button_cnt;
  
  // When the push-button is pushed or released, we increment the counter
  // The counter has to be maxed out before we decide that the push-button state has changed
  
  wire button_idle = (button_state==button_sync_1);
  wire button_cnt_max = &button_cnt;	// true when all bits of PB_cnt are 1's
  
  always @(posedge clk)
    if(button_idle)
      button_cnt <= 0;  // nothing's going on
    else
      begin
      button_cnt <= button_cnt + 16'd1;  // something's going on, increment the counter
      if(button_cnt_max) button_state <= ~button_state;  // if the counter is maxed out, PB changed!
    end
  
  assign button_down = ~button_idle & button_cnt_max & ~button_state;
  assign button_up   = ~button_idle & button_cnt_max &  button_state;
endmodule
