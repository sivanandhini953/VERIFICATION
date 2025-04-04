class monitor ;
  
  transaction trans;
  mailbox mon2scb;
  virtual intf vintf;
  
  function new(virtual intf vintf,mailbox mon2scb);
    
    this.vintf=vintf;
    this.mon2scb=mon2scb;
    
  endfunction
  
  task main();
    
    trans=new();
    
    repeat(10) begin
      #1;
      
      @(posedge vintf.clk)
      
      trans.d <= vintf.d;
      trans.reset <= vintf.reset;
      trans.q <= vintf.q;
      trans.qbar <= vintf.qbar;
      
      trans.display("monitor class signal");
      
      mon2scb.put(trans);
      
    end
  endtask
endclass
      
      
      
      
  
