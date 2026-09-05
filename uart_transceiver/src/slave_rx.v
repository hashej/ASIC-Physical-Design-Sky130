module slave_rx(
input clk,
input rst,
input tick,
input rx,
output reg [7:0] data_out
);

reg [3:0] cnt;
reg [7:0] rx_data;
reg rx_parity;

always @(posedge clk or posedge rst) begin
if(rst) begin
data_out <= 0;
rx_data <= 0;
rx_parity <= 0;
cnt <= 11; 
end

else if(rx == 0 && cnt == 11) begin
cnt <= 0;
end

else if(tick && cnt < 11) begin

if(cnt >= 1 && cnt <= 8) begin
rx_data[cnt - 1] <= rx; 
end
else if(cnt == 9) begin
rx_parity <= rx; 
end
else if(cnt == 10) begin
if(rx_parity == (^rx_data)) begin
data_out <= rx_data;
end
end

if(cnt == 10) begin
cnt <= 11; 
end
else begin
cnt <= cnt + 1;
end

end
end
endmodule
