module Decd(select,out);

  input [4:0]select;
  output [31:0]out;
  
  wire [31:0]mid;
  wire n0,n1,n2,n3,n4;
  
  not not_gate0(n0,select[0]);
  not not_gate1(n1,select[1]);
  not not_gate2(n2,select[2]);
  not not_gate3(n3,select[3]);
  not not_gate4(n4,select[4]);

  and and_gate0(out[0],n4,n3,n2,n1,n0);  
  and and_gate1(out[1],n4,n3,n2,n1,select[0]);
  and and_gate2(out[2],n4,n3,n2,select[1],n0);
  and and_gate3(out[3],n4,n3,n2,select[1],select[0]);
  and and_gate4(out[4],n4,n3,select[2],n1,n0);
  and and_gate5(out[5],n4,n3,select[2],n1,select[0]);
  and and_gate6(out[6],n4,n3,select[2],select[1],n0);
  and and_gate7(out[7],n4,n3,select[2],select[1],select[0]);
  and and_gate8(out[8],n4,select[3],n2,n1,n0);
  and and_gate9(out[9],n4,select[3],n2,n1,select[0]);
  and and_gate10(out[10],n4,select[3],n2,select[1],n0);
  and and_gate11(out[11],n4,select[3],n2,select[1],select[0]);
  and and_gate12(out[12],n4,select[3],select[2],n1,n0);
  and and_gate13(out[13],n4,select[3],select[2],n1,select[0]);
  and and_gate14(out[14],n4,select[3],select[2],select[1],n0);
  and and_gate15(out[15],n4,select[3],select[2],select[1],select[0]);
  and and_gate16(out[16],select[4],n3,n2,n1,n0);
  and and_gate17(out[17],select[4],n3,n2,n1,select[0]); 
  and and_gate18(out[18],select[4],n3,n2,select[1],n0);
  and and_gate19(out[19],select[4],n3,n2,select[1],select[0]);
  and and_gate20(out[20],select[4],n3,select[2],n1,n0);
  and and_gate21(out[21],select[4],n3,select[2],n1,select[0]);
  and and_gate22(out[22],select[4],n3,select[2],select[1],n0);
  and and_gate23(out[23],select[4],n3,select[2],select[1],select[0]);
  and and_gate24(out[24],select[4],select[3],n2,n1,n0);
  and and_gate25(out[25],select[4],select[3],n2,n1,select[0]);
  and and_gate26(out[26],select[4],select[3],n2,select[1],n0);
  and and_gate27(out[27],select[4],select[3],n2,select[1],select[0]);
  and and_gate28(out[28],select[4],select[3],select[2],n1,n0);
  and and_gate29(out[29],select[4],select[3],select[2],n1,select[0]);
  and and_gate30(out[30],select[4],select[3],select[2],select[1],n0);
  and and_gate31(out[31],select[4],select[3],select[2],select[1],select[0]);
  
endmodule
