class transaction;
  rand bit a;
  rand bit b;
  bit sum;
  bit carry;
  
  function void display(string name);
    
    $display("----------------------");
    $display("%s",name);
    $display("time=%0t | a=%b | b=%b | sum=%b | carry=%b",$time,a,b,sum,carry);
    $display("----------------------");
    
  endfunction
  
endclass
  
  
