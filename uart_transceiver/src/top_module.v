module top_module(
input clk,
input rst,
input send_btn,
input [7:0] sw,
output [7:0] led,
output tx_pin,
input rx_pin
);
wire tick;
baud_gen b1(
.clk(clk),
.rst(rst),
.tick(tick)
);
master_tx t1(
.clk(clk),
.rst(rst),
.tick(tick),
.send(send_btn),
.data_in(sw),
.tx(tx_pin)
);
slave_rx r1(
.clk(clk),
.rst(rst),
.tick(tick),
.rx(rx_pin),
.data_out(led)
);
endmodule
