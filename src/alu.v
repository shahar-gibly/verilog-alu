module alu #(parameter N=4)(

input wire [N-1:0] A,
input wire [N-1:0] B,
input wire [3:0] opcode,
output reg [N-1:0] Y,
output reg Z,C,Nf,V


);

localparam SHW = (N > 1) ? $clog2(N) : 1;
  wire [SHW-1:0] sh = B[SHW-1:0];

always @(*) begin
      Y = {N{1'b0}};
    C = 1'b0;
    V = 1'b0;
    case (opcode)
   
        4'b0000: begin //ADD
            {C,Y}= {1'b0,A} + {1'b0,B};
            V=(~(A[N-1]^B[N-1])) & (A[N-1]^Y[N-1]); //OverFlow (signed)
            end
        4'b0001: begin //SUB (C=1 => No Borrow)
            {C,Y}={1'b0,A} - {1'b0,B};
            V=((A[N-1]^B[N-1])) & (A[N-1]^Y[N-1]);
            C = ~C;
        end

        4'b0010: Y= A & B; //AND
        4'b0011: Y = A | B; //OR
        4'b0100: Y= A ^ B;  //XOR
        4'b0101: Y= ~A; //NOT
        4'b0110: begin
             Y=A<<sh; //SHIFT LEFT
             C = (sh != 0) ? A[N - sh] : 1'b0;
        end
        4'b0111: begin
             Y=A>>sh; //SHIFT RIGHT
             C = (sh != 0) ? A[sh-1] : 1'b0;
        end
        4'b1000: Y=$signed(A)>>> sh; //SRA

       default: Y = {N{1'b0}};
endcase

Z  = (Y == {N{1'b0}});
Nf = Y[N-1];  // MSB


end
    

endmodule