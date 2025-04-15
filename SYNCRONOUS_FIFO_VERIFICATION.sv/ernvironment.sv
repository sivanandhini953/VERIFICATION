`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
     transaction tr;
     generator gen;
     driver drv;
     monitor mon;
     scoreboard sco;
  
     mailbox gen2drv;
     mailbox mon2scb;
  
     event starts;
  
     virtual intf vif;
  
  function new(virtual intf vif);
    
    this.vif=vif;
    
    gen2drv = new();
    mon2scb = new();
   
    
    gen=new(gen2drv);
    drv=new(vif,gen2drv);
    mon=new(vif,mon2scb);
    sco=new(mon2scb);
    
    gen.start=starts;
    sco.start=starts;
    
  endfunction
  
  task main();
    
    fork
      gen.main();
      drv.main();
      mon.main();
      sco.main();
      
    join
    
  endtask
  
  
endclass
