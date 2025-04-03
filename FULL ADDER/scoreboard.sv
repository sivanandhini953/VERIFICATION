class scoreboard;
  mailbox mon2scb;
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  task main();
    transaction trans;
    repeat(2)
      begin
        mon2scb.get(trans);
        trans.display("scoreboard signals");
        if
          ((trans.a^trans.b^trans.c == trans.sum)&&((trans.a& trans.b)|(trans.c& trans.b)|(trans.a& trans.c) == trans.carry))
        $display("pass");
        else
         $display("fail");
      end
  endtask
endclass
           
