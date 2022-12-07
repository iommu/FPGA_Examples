module au_top(
    input clk,              // 100MHz clock
    input rst_n,            // reset button (active low)
    output [7:0] led,       // 8 user controllable LEDs
    input usb_rx,           // USB->Serial input
    output usb_tx ,         // USB->Serial output
    output [23:0] io_led ,   // LEDs on IO Shield
    output [7:0] io_seg,      // 7-segment LEDs on IO Shield
    output [3:0] io_sel,       // Digit select on IO Shield
    input [4:0] io_button,    // 5 buttons on IO Shield
    input [23:0] io_dip     // DIP switches on IO Shield
    );
    
    wire rst;
    
    // The reset conditioner is used to synchronize the reset signal to the FPGA
    // clock. This ensures the entire FPGA comes out of reset at the same time.
    reset_conditioner reset_conditioner(.clk(clk), .in(!rst_n), .out(rst));
    
    assign led = 8'h00;      // turn LEDs off

    assign usb_tx = usb_rx;  // echo the serial data
    
    assign io_led[0] = io_dip[0] & io_dip[1];
    assign io_led[1] = io_dip[2] & io_dip[3];
    assign io_led[2] = io_dip[4] & io_dip[5];
    assign io_led[3] = io_dip[6] & io_dip[7];

    
endmodule