// Code your design here
module sram(intf inf);
 

 
  reg [7:0] mem [16];
  
  always @(posedge inf.clk )begin
    
    if (!inf.reset)begin
      
      foreach(mem[i])
        mem[i] <= 8'h00;
    end
    
    else if(inf.WE)
        
      mem[inf.addr] <= inf.data_in;
      
    else if(!inf.WE)
        inf.data_out<=mem[inf.addr];
      
    end
    
    endmodule
  
