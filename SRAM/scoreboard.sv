class scoreboard;
  
  transaction trans;
  bit [7:0] temp [16];
  bit [7:0] temp_data;
  mailbox mon2scb;
  
  event my_event;
  
  function new( mailbox mon2scb); 
    this.mon2scb=mon2scb;
    
  endfunction
  
  task main();
    
    trans=new();
    
    repeat(10) begin
    
      mon2scb.get(trans);
      
      trans.display("SCOREBOARD SIGNALS");
      
      if(trans.WE)
        
        write();
      
      else if(!trans.WE )
      
        read();
      
      -> my_event;
    end
  endtask
      
      task write();
      
        temp[trans.addr]<=trans.data_in;
        
        $display("data=%d stored in in addr=%d",trans.data_in,trans.addr);
      endtask
      
      task read();
        
        temp_data<=temp[trans.addr];
        
        if(temp_data==trans.data_out)begin
        $display("DATA IS MATCHED at Address: %0d, Expected: %0d, Got: %0d", trans.addr, temp_data, trans.data_out);
        end
                 else begin
        $display("DATA IS NOT MATCHED at Address: %0d, Expected: %0d, Got: %0d", trans.addr, temp_data, trans.data_out);
                 end
  endtask
endclass
      
      
      
      
