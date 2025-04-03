class scoreboard;
  virtual intf vintf;
  mailbox mon2scb;
  transaction trans;
  event gen_event;
  
  function new( mailbox mon2scb);
    
    this.mon2scb=mon2scb;
    
  endfunction
  
  task main();
    trans=new();
    repeat(2) begin 
    
      mon2scb.get(trans);
      
      trans.display("scoreboard class signals");
      
      if ((trans.a^trans.b==trans.sum)&&((trans.a&trans.b)==trans.carry))
        
        $display("pass");
      
      else
        $display("fail");
      #1;
      -> gen_event;
    end
  endtask
endclass
