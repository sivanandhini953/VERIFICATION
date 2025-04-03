class generator;
  transaction trans;
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  task main();
    repeat(2)
      begin
        trans = new();
        trans.randomize();
        trans.display("generator class signal");
        gen2drv.put(trans);
      end
  endtask
endclass
