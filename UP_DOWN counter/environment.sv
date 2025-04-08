`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"



class environment;
  
  transaction tr;
  generator gen ;
  driver drv;
  monitor mon;
  scoreboard scb;
  
  mailbox gen2drv;
  mailbox mon2scb;
  
  event scbdone;
  
  virtual intf vif;
  
  function new(virtual intf vif);
    
    this.vif=vif;
    
    gen2drv=new();
    mon2scb=new();
    
    gen=new(vif,gen2drv);
    drv=new(vif,gen2drv);
    mon=new(vif,mon2scb);
    scb=new(mon2scb);
    
    
    gen.scb_done=scbdone;
    scb.scb_done=scbdone;
    
    $display("environment new");
    
  endfunction
  
  
  task run();
    fork
      gen.run();
      drv.run();
      mon.run();
      scb.run();
      
    join
    
  endtask
endclass
  
