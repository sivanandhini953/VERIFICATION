`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"


class environment;
  
  transaction trans;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  
  
  virtual intf sr;
  
  mailbox gen2drv;
  mailbox mon2scb;
  
  event myevent;
  
  function new(virtual intf sr);
    
    this.sr=sr;
    
    gen2drv=new();
    mon2scb=new();
    
    gen=new(gen2drv);
    drv=new(sr,gen2drv);
    mon=new(sr,mon2scb);
    scb=new(mon2scb);
    
    gen.my_event=myevent;
    scb.my_event=myevent;
    
  endfunction
  
  
  task main();
    
    fork
        gen.main();
      drv.main();
      mon.main();
      scb.main();
      
    join
  endtask
endclass
      
    
  
