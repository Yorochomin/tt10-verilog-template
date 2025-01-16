module hankasan (ck, res, a, b);
input ck;
input [3:0] a;
output [3:0] b;
reg [3:0] q0, q1, q2, q3;
input [3:0] switch;
wire[3:0] w;
wire laod0, load1, load2, load3;

function select(
input [3:0] din1,
input [3:0] din2,
input [3:0] din3,
input [3:0] din4, 
input [1:0] sel
);

case(sel)
2'h0: select = din1;
2'h1: select = din2;
2'h2: select = din3;
2'h3: select = din4;
default: select = 4'bxxxx;
endcase

endfunction
