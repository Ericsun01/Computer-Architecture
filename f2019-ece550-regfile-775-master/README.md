# Project Checkpoint 2
 - Author: Junqi Sun
 - Course: ECE 550
 - Term: 2019 fall first semester
 - Professor Rabih Younes

## Regfile
### Hierarchical Structure
  The hierarchical structure of my Regfile design is: There are mainly two blocks of the whole projects. The first one is the write_port, the second one is trans. The trans blocks is consist of 32 blocks of subtrans blocks, which realize the operation function from writing information from DFFE, to the final output screened by tristate buffer through a 32 bits wire. 

### Write_port
  This blocks is consist of a decoder, 32 andgates. The decoder is designed according to truth table of itself(32 expressions with 5 inputs). Then using And operation to all outputs to get the result(enable signal).
  
### trans
  This blocks is consist of 32 subtrans blocks, which is made up of 32-bits DFF, two tristate buffer(one for readA, one for readB). I use the DFF to get writing input, then use the tristate buffer to decide whether letting this signal pass. Then I use generate for loop to repeat this block 32 times to get the trans block.
  
### Testing
  When I perform the compilation and testbench, there are only two warning and no error. Also, I tested my circuits to as fast as 100MHZ, and it can work correctly.
  
  
