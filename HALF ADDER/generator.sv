class generator;
  
  transaction trans;
  mailbox gen2drv;
  event gen_event;
  
  
  function new(mailbox gen2drv);
    
    this.gen2drv=gen2drv;
    
  endfunction
  
  
  task main();
    trans=new();
    repeat(2)begin 
      #0;
     
      trans.randomize();
     
      trans.display("generator class signal");
      
      gen2drv.put(trans);
      
      
      @(gen_event);
    end 
    
    endtask
endclass
    
