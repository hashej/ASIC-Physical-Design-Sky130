module spm (
    input wire [31:0] a,
    input wire [31:0] b,
    input wire [31:0] c,
    input wire [31:0] d,
    output wire [63:0] out
);

    wire [63:0] prod1;
    wire [63:0] prod2;
    
    assign prod1 = a * b;
    assign prod2 = c * d;
    

    assign out = prod1 + prod2;

endmodule

