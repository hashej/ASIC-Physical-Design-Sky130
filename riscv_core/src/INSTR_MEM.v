module instruct_mem(
    input  wire [6:0]  addr_instr_mem,
    input  wire        instruct_en,
    input  wire        clk,
    output reg  [31:0] instruction
);
    reg [31:0] mem [127:0];

    initial begin
    	$readmemh("src/instr.mem", mem);
    end

    always @(*) begin
        if (instruct_en) begin
            instruction = mem[addr_instr_mem];
        end else begin
            instruction = 32'b0;
        end
    end
endmodule
