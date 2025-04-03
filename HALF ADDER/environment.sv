`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"


class environment;
  
  generator gen ;
  driver drv;
  monitor mon;
  scoreboard scb;
  
  mailbox gen2drv;
  mailbox mon2scb;
  
  virtual intf vintf;
  event genevent;
  
  function new(virtual intf vintf);
    
    this.vintf=vintf;
    gen2drv=new();
    mon2scb=new();
    
    gen=new(gen2drv);
    drv=new(vintf,gen2drv);
    mon=new(vintf,mon2scb);
    scb=new(mon2scb);
    
    gen.gen_event=genevent;
    scb.gen_event=genevent;
    
  endfunction
  
  task test_run;
    
    fork
      gen.main();
      drv.main();
      mon.main();
      scb.main();
      
    join 
  endtask 
endclass
      
    
