module frequency_div4(clk, clk_out);
 
input clk;
output clk_out;
 
reg [1:0] r_reg;
wire [1:0] r_nxt;
reg clk_track;
 
always @(posedge clk)
 
begin 
  if (r_nxt == 2'b10)
 	   begin
	     r_reg <= 0;
	     clk_track <= ~clk_track;
	   end
  else 
      r_reg <= r_nxt;
end
 
 assign r_nxt = r_reg+1;   	      
 assign clk_out = clk_track;
 
endmodule