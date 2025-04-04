class scoreboard;
  
  transaction trans;
  mailbox mon2scb;
  event my_event;
  
  function new( mailbox mon2scb);
    this.mon2scb=mon2scb;
    
  endfunction
  
  task main();
    
    trans=new();
    
    repeat(10)begin
      #10;
      mon2scb.get(trans);
      trans.display("scoreboard class signal");
      if(((trans.d==trans.q)&&(trans.qbar==~trans.q))||((!trans.reset)&&(trans.q==0)&&(trans.qbar==1)))begin
        $display("---------------------");
        $display("PASS");
      $display("---------------------");
      end
      else begin
        $display("---------------------");
        $display("FAIL");
      
      $display("---------------------");
      end
      ->my_event;
    end
  endtask
endclass
