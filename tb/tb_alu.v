`timescale 1ns/1ps

module tb;
localparam N = 8;
reg  [3:0] opcode;
reg  [N-1:0] A,B;
wire [N-1:0] Y;
wire Z,C,Nf,V;

alu #(.N(N)) dut(.A(A), .B(B), .opcode(opcode), .Y(Y), .Z(Z), .C(C), .Nf(Nf), .V(V));

initial begin
    $dumpfile("waves.vcd");
    $dumpvars(0,tb);
    $display(" time |   A    B  op |      Y| Z N C V");
     A=0; B=0; opcode=0; #1;

     $monitor("%4t | A=%b B=%b op=%b | Y=%b | Z=%b N=%b C=%b V=%b"  , $time, A, B, opcode, Y, Z, Nf, C, V);

    #9;
    A=5; B=2; opcode=0; #10;
    A=5; B=2; opcode=1; #10;
    A=5; B=2; opcode=2; #10;
    A=5; B=2; opcode=3; #10;
    A=5; B=2; opcode=4; #10;
    A=5; B=2; opcode=5; #10;
    A=5; B=2; opcode=6; #10;
    A=5; B=2; opcode=7; #10;
    A = 8'b1000_0000; B = 1; opcode = 4'b1000; #10;


    $finish;
end

endmodule
