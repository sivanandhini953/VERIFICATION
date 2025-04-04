class monitor ;
  
  transaction trans;
  mailbox mon2scb;
  virtual intf sr;
  
  function new(virtual intf sr,mailbox mon2scb);
  this.sr=sr;
    this.mon2scb=mon2scb;
    
  endfunction
  
  
  task main();
    
    trans=new();
    
    repeat(10) begin
      #1;
      @(posedge sr.clk)
      trans.reset=sr.reset;
      trans.WE=sr.WE;
     
      
      trans.addr=sr.addr;
     trans.data_in=sr.data_in;
      trans.data_out=sr.data_out;
      
      trans.display("MONITOR SIGNALS");
      
      mon2scb.put(trans);
      
    end
  endtask
endclass
      
      
