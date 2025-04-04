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
  event myevent;
  
  mailbox mon2scb;
  mailbox gen2drv;
  
  virtual intf vintf;
  
  function new(virtual intf vintf);
    
    mon2scb=new();
    gen2drv=new();
    
    gen=new(gen2drv);
    drv=new(vintf,gen2drv);
    mon=new(vintf,mon2scb);
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
    
    
