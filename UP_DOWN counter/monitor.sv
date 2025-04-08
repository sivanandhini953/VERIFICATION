
`define MONITOR_IF vif.MON_INF.mon_cb

class monitor;
  
  transaction tr;
  mailbox mon2scb;
  virtual intf vif;
  
  
  function new(virtual intf vif,mailbox mon2scb);
    
    this.vif=vif;
    this.mon2scb=mon2scb;
    
  endfunction
  
  
  task run();
    
    
    
    repeat(500) begin
      
      tr=new();
      
      
      
      @(posedge vif.clk)
     #1;
      tr.rst      =vif.rst;
      tr.up_down  =vif.up_down;
      tr.count    =vif.count;
      
       mon2scb.put(tr);
      
      tr.display("[MON]");
      
     
      
    end
  endtask
endclass
      
