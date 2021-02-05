module FA(in1,in2,cin,sum,cout);
   input in1, in2, cin;
   output sum, cout;
	wire out_and0, out_and1, out_and2;
	xor xor_gate(sum, in1, in2, cin);
	and and_gate0(out_and0, in1, in2);
	and and_gate1(out_and1, in1, in3);
	and and_gate2(out_and2, in2, in3);
	or or_gate(cout, out_and0, out_and1, out_and2);	
endmodule
	