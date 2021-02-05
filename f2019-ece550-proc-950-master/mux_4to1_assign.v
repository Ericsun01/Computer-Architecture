module mux_4to1_assign ( input [31:0] a,                 // 32-bit input called a
                         input [31:0] b,                 // 32-bit input called b
                         input [31:0] c,                 // 32-bit input called c
                         input [31:0] d,                 // 32-bit input called d
                         input [1:0] sel,               // input sel used to select between a,b,c,d
                         output [31:0] out);             // 32-bit output based on input sel
 
   // When sel[1] is 0, (sel[0]? b:a) is selected and when sel[1] is 1, (sel[0] ? d:c) is taken
   // When sel[0] is 0, a is sent to output, else b and when sel[0] is 0, c is sent to output, else d
   assign out = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a); 
endmodule