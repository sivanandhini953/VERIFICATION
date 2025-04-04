class driver;
  
  virtual intf vintf;
  mailbox gen2drv;
  transaction trans;
  
  function new(virtual intf vintf,mailbox gen2drv);
    
    this.vintf=vintf;
    this.gen2drv=gen2drv;
    
  endfunction
  
  task main();
    
    trans=new();
    
    repeat(10)begin
      
      gen2drv.get(trans);
      
      @(posedge vintf.clk)
     
      vintf.d <= trans.d;
      
      trans.display("driver class signal");
      
    end
  endtask
endclass
      
      
      
      
