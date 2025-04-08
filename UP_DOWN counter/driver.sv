`define DRIVER_IF vif.DRI_INF.drv_cb


class driver;
  
  transaction tr;
  mailbox gen2drv;
  virtual intf vif;
  
  
  function new(virtual intf vif,mailbox gen2drv);
    
    this.vif=vif;
    this.gen2drv=gen2drv;
    
    endfunction 
  
  task run();
    
    
    
    repeat(500) begin
     
      tr=new();
      
      gen2drv.get(tr);
      
     // @(posedge vif.clk)
      
      
      `DRIVER_IF.up_down <= tr.up_down;
      `DRIVER_IF.rst     <= tr.rst;
      
      tr.display("[DRI]");
     
    end
    
  endtask
endclass

       
      
  
