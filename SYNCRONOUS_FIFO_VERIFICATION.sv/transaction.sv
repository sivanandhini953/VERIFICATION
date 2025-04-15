class transaction;
  
    
  rand bit rst;
  rand bit push;
  rand bit pop;
  randc bit [3:0]d_in;
  bit [3:0]d_out;
  bit full;
  bit empty;

  
  constraint c1{push!=pop;}
 
  constraint c2{rst dist{1:=1,0:=99};}
  
 // constraint c3{pop dist{1:=80,0:=20};}
  
//  constraint c4{pop dist{1:=80,0:=20};}
  
  
  
  
  function void display(string name);
    
  $display("[%0t]  [%s ] | reset=%b | push=%b | pop=%b | data_in=%d |  data_out=%d | full=%b | empty=%b",$time,name,rst,push,pop,d_in,d_out,full,empty);
    
 endfunction
  
  
   
  function void dis_line();
      
    $display("-------------------------------");
      
    endfunction
  
endclass
