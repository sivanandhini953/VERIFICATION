class generator;
  
  mailbox gen2drv;
  transaction trans;
  event my_event;
  
  function new(mailbox gen2drv);
this.gen2drv=gen2drv;
  endfunction
  
  task main();
    
    trans=new();
    
    repeat(10) begin
      
      
      trans.randomize();
      trans.display("GENERATOR SIGNALS");
      
      gen2drv.put(trans);
      @(my_event);
      
    end
  endtask
endclass
