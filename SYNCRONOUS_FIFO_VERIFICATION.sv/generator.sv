

class generator;
  
  transaction tr;
  mailbox gen2drv;
  event start;
  
  function new(mailbox gen2drv);
    
    this.gen2drv=gen2drv;
    
  endfunction
  
  task main();
    
    
    
    repeat(50)
    
    begin
    	 tr=new(); 
			void'(tr.randomize());
      		 gen2drv.put(tr);
      
      
      tr.dis_line();
      tr.display("GEN");
      
     
      
      @(start);
      
    end 
  endtask
endclass
