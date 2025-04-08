
  
  class scoreboard;
    
    transaction tr;
    mailbox mon2scb;
    event scb_done;
    
    
    bit [3:0]temp;
    
    function new(mailbox mon2scb);
      
      this.mon2scb=mon2scb;
      
    endfunction
    
    task run();
      
      
      
      repeat(500) begin
        
        tr=new();
        
        
        mon2scb.get(tr);
        
        tr.display("[SCB]");
        
        if(tr.rst)
          temp=0;
        
        else 
          
          case(tr.up_down)
        
        0:temp = temp-1;
        1:temp = temp+1;
            
          endcase
        
        check();
        
        tr.dis_line();
        
      // ->scb_done;
       end
    endtask
    
    
    task check();
      
      if (temp==tr.count)
        
    $display(" DATA IS MATCHED");
        else 
          $display("DATA IS NOT MATCHED");
		endtask
    endclass
        
      
      
