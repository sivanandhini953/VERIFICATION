interface intf(input logic clk);
  
  logic reset;
  logic WE;
  
  
  logic [3:0]addr;
  logic [7:0]data_in;
  logic [7:0]data_out;
  
  modport intff(input reset,WE,addr,data_in, output data_out);
   
endinterface
  
