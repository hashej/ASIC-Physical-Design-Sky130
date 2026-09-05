module baud_gen(
input clk,
input rst,
output reg tick
);
reg [13:0] cnt;

always @(posedge clk or posedge rst) begin
if(rst) begin
cnt <= 0;
tick <= 0;
end
else if(cnt == 10416) begin
cnt <= 0;
tick <= 1;
end
else begin
cnt <= cnt + 1;
tick <= 0;
end
end
endmodule
