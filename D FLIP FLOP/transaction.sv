class transaction;
  
   bit reset;
  rand bit d;
  bit q;
  bit qbar;
  
 
  
  function void display(string name);
    $display("------------------");
    $display("%s",name);
    
    $display("reset=%b | d=%b | q=%b Qbar=%b",reset,d,q,qbar);
    
  endfunction 
endclass
  
  
