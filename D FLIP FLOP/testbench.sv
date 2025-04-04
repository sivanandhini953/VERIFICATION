// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "test.sv"

module testbench;
  intf intff();
  test tst(intff);
  
  d_ff dff(intff);
  
  initial intff.clk=0;
  always #5 intff.clk=~intff.clk;
  
  
  initial begin
    
    $dumpfile("waves.vcd");
    $dumpvars;
    
  end
  
 initial begin
    

    
    intff.reset=1;
    #20
    intff.reset=0;
    
    #200;
    $finish;
    
  end
    
    
  
endmodule
  
  
  
  
