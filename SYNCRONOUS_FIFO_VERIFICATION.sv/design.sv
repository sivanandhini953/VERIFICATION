// Code your design here
module sync_fifo(
input clk,
  input rst,
  input push,
  input pop,
  input [3:0]d_in,
  output reg [3:0]d_out,
  output full,
  output empty

);
  
  reg [2:0]wptr;
  reg [2:0]rptr;
  reg [3:0] fifo [7:0];
  
  always @(posedge clk or negedge rst )
    if(rst)
      
      begin        
        d_out <= 0;
        //empty <= 0;
        //full <= 0;
      end
  
  always @(posedge clk or posedge rst)
    begin
      
    if(rst)
      wptr <= 0;
  else if (push && (!full))begin
    fifo[wptr] <= d_in;
  	wptr <= wptr+1;
  end
  
    end
  
    always @(posedge clk or posedge rst)
    begin
      
    if(rst)
      rptr <= 0;
      else if (pop && (!empty))begin
        d_out <= fifo[rptr] ;
  		rptr <= rptr+1;
  end
  
    end
  
  assign full = ((wptr + 1'b1) == rptr)?1:0;
  assign empty = (wptr == rptr)?1:0;
  
endmodule
  
  
  
  
  
  
   
        
        
    
    
  
