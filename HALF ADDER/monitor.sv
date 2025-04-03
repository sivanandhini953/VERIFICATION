class monitor;
  
  virtual intf vintf;
  mailbox mon2scb;
  transaction trans ;
  
  
  function new(virtual intf vintf,mailbox mon2scb);
    
    this.vintf=vintf;
    this.mon2scb=mon2scb;
    
  endfunction
  
  task main();
    trans=new();
    repeat(2) begin
      
    
      #1;
    trans.a=vintf.a;
    trans.b=vintf.b;
    trans.sum=vintf.sum;
    trans.carry=vintf.carry;
    
    mon2scb.put(trans);
    
      trans.display("monitor class signals");
      #1;
      
    end
  endtask
endclass
