module fulladd(x, y, cout, sum);
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

always @(posedge ck)begin
    if(load==1)begin
        q0<=q0;
        q1<=q1;
        q2<=q2;
        q3<=q3;
    end else begin
        q0<=w;
        q1<=w;
        q2<=w;
        q3<=w;
    end
end

assign x = select(q0, q1, switch, 1'b0, sel);

input [3:0] x;
input [3:0] y;
output [3:0] sum;
wire [3:0] cout;
fulladd add0(x[0], y[0], 1'b0, cout[0], sum[0]);
fulladd add1(x[1], y[1], cout[0], cout[1], sum[1]);
fulladd add2(x[2], y[2], cout[1], cout[2], sum[2]);
fulladd add3(x[3], y[3], cout[2], cout[3], sum[3]);

assign q0, q1, q2, q3 = sum; 

endmodule
endmodule
