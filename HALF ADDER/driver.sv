class driver;
  
  mailbox gen2drv;
   transaction trans;
  
  virtual intf vintf;
  
  function new(virtual intf vintf,mailbox gen2drv);
    
    this.vintf=vintf;
    this.gen2drv=gen2drv;
    
  endfunction
  
  task main();
    trans=new();
    
    repeat(2) begin
      
   
    
    
      
      gen2drv.get(trans);
      
      vintf.a=trans.a;
      vintf.b=trans.b;
      
     
      trans.display("driver class signal");
      #1;
    end
  endtask
      
endclass
    
