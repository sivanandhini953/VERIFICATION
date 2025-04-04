class transaction;
  
  bit reset;
  bit WE;
 
  rand bit [3:0]addr;
  rand bit [7:0]data_in;
  bit [7:0]data_out;
  
 

  
  
 
  
  function void display(string name);
    
    $display("%s",name);
    
    $display("time=%0t | reset=%b | WE=%b | ADDR=%d | DATA_IN=%d | DATA_OUT=%d ",$time,reset,WE,addr,data_in,data_out);
   
    
  endfunction
endclass
