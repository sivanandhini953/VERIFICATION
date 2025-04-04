class generator;
  
  transaction trans;
  mailbox gen2drv;
  event my_event;
  
  function new( mailbox gen2drv);
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
    trans=new();
    repeat(10)begin
      #0;
      trans.randomize();
      trans.display("generator class display");
      
      gen2drv.put(trans);
      
      @(my_event);
      
    end
  endtask
endclass
      
    
