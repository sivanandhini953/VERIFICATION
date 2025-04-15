class driver;
  
 transaction tr;
  mailbox gen2drv;
  virtual intf vif;
  
  function new(virtual intf vif,mailbox gen2drv);
    
    this.vif=vif;
    this.gen2drv=gen2drv;
    
  endfunction
  
  task main();
    
    repeat(50) begin
      
      tr=new();
      
      gen2drv.get(tr);
      @(posedge vif.clk)
      
      vif.rst=tr.rst;
      vif.push=tr.push;
      vif.pop=tr.pop;
      vif.d_in=tr.d_in;
      
      tr.display("DRV");
      
    end
      endtask 
      
      endclass
     
