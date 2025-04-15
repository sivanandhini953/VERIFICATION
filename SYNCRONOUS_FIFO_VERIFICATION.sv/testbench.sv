// Code your testbench here
// or browse Examples

`include "interface.sv"
`include "test.sv"

module testbench;

  
  always #5 inf.clk=~inf.clk;
  
  intf inf();
  test tt;
  sync_fifo uut(
            .clk	(inf.clk),
      		.rst	(inf.rst),
    		.push	(inf.push),
    		.pop	(inf.pop),
   		    .d_in	(inf.d_in),
      		.full	(inf.full),
      		.empty	(inf.empty),
    		.d_out	(inf.d_out)
);
  
    initial begin
    tt=new(inf);
  end
 
    initial begin
    tt.main();
  end
  
   initial begin
    inf.rst=1;
     inf.pop=0;
     inf.push=1;
  end
  
   initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #500;
    $finish;
   end
  
endmodule
    
    
