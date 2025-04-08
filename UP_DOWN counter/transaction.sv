class transaction;
  
  rand bit up_down;
  rand bit rst;
  bit [3:0]count;
  
  constraint distr{up_down dist{0:=50,1:=50};}
  constraint distr1{rst dist{1:=10,0:=90};}
  
  function void display(string name);
    
    $display("[%0t]  [%s] | rst:%b |  up_down:%b | count=%d",$time,name,rst,up_down,count);
    
  endfunction
  
  function void dis_line();
      
    $display("-------------------------------");
      
    endfunction
  
endclass
