// Code your testbench here
// or browse Examples

`include "interface.sv"
`include "test.sv"

module testbench;
  bit clk;
  
  always #5 clk=~clk;
  intf inf(clk);
  test tt(inf);
  
  
  sram uut(inf);
  
   initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
  end
  
 
  
  
  
  initial begin 
    #5;
    inf.reset = 0;
    
    #1;
    inf.reset = 1;
    
    inf.WE 	= 1;
    
    #50;
    inf.WE 	= 0;
  
    

    #5000; $finish;
  
  end
endmodule
    
