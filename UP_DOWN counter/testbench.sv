
`include "interface.sv"
`include "test.sv"

module testbench;
  
 

  
  always #5 inf.clk=~inf.clk;
  
  intf inf();
  test tt;
  up_down_count cnt(inf);
  
  
  
  initial begin
    tt=new(inf);
  end
 
    initial begin
    tt.run();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #500;
    $finish;
    
  end
  initial begin
    inf.clk=0;
    
    
    inf.rst=1;
    
    
    
    #500;
    $finish;
    
  end
  
  
endmodule
    
    
  
