module master_tx(
input clk,
input rst,
input tick,
input send,
input [7:0] data_in,
output reg tx
);

reg [3:0] cnt;
reg [7:0] data_reg;

always @(posedge clk or posedge rst) begin
if(rst) begin
tx <= 1;
cnt <= 11;
data_reg <= 0;
end
else if(send && cnt == 11) begin
data_reg <= data_in;
cnt <= 0;
end
else if(tick && cnt < 11) begin

if(cnt == 0) begin
tx <= 0;
end
else if(cnt >= 1 && cnt <= 8) begin
tx <= data_reg[cnt - 1]; 
end
else if(cnt == 9) begin
tx <= ^data_reg; 
end
else if(cnt == 10) begin
tx <= 1; 
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
