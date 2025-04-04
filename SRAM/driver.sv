class driver;
  
  transaction trans;
  mailbox gen2drv;
  virtual intf sr;
  
  function new(virtual intf sr,mailbox gen2drv);
  this.sr=sr;
    this.gen2drv=gen2drv;
    
  endfunction
  
  task main();
    
    trans=new();
    
    repeat(10)
      begin
       
        gen2drv.get(trans);
        
        @(posedge sr.clk)
        
         sr.addr=trans.addr;
        sr.data_in=trans.data_in;
        
        
        trans.display("DRIVER SIGNALS");
        
      end
  endtask
endclass
        
        
        
        
  
  
