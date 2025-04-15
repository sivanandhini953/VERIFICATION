class monitor ;
  
  transaction tr;
  mailbox mon2scb;
  virtual intf vif;
  
  function new(virtual intf vif,mailbox mon2scb);
    
    this.vif=vif;
    this.mon2scb=mon2scb;
    
  endfunction
  
  task main();
    
    
    
    repeat(50) begin
   
      tr=new();
      @(posedge vif.clk) 
      #1; 
      tr.rst    =vif.rst;
      tr.push   =vif.push;
      tr.pop    =vif.pop;
      tr.d_in   =vif.d_in;
      tr.d_out  =vif.d_out;
      
      tr.full   =vif.full;
      tr.empty  =vif.empty;
      
      
      
      mon2scb.put(tr);
      
      tr.display("MON");
    end
    endtask
endclass
      
      
      
      
