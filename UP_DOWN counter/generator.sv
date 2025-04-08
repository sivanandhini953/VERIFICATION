class generator;
  
  virtual intf vif;
  transaction tr;
  
  mailbox gen2drv;
  
  event scb_done;
  
  function new(virtual intf vif,mailbox gen2drv);
    this.vif 	= vif;
    this.gen2drv=gen2drv;
    
  endfunction
  
  task run();
    
    
    
    repeat(500) begin
      tr=new();
      
     @(posedge vif.clk)
      
      void'(tr.randomize());
      gen2drv.put(tr);
   tr.dis_line(); 
    tr.display("[GEN]");
     // tr.dis_line();
    
   //  @(scb_done);  
    end
  endtask
  
endclass
    
