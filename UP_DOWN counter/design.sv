module up_down_count(intf inf ) ;
  
  always @(posedge inf.clk) begin
    if(inf.rst)
      
      inf.count <= 0;
    
    else begin
      
      case(inf.up_down)
        0:inf.count <= inf.count-1;
        1:inf.count <= inf.count+1;
        
      endcase
      
  end
  end
    endmodule
