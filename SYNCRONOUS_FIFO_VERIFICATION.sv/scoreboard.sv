class scoreboard;
  
  transaction tr;
  mailbox mon2scb;
  event start;
  
  
  bit [3:0] que[$];
  bit [3:0] temp ;
  
 function new(mailbox mon2scb);
  this.mon2scb=mon2scb;
 endfunction
  
  task main();
    
    repeat(100) 
      begin
        tr=new();
        mon2scb.get(tr);
          tr.display("SCB");
        
        
        fork
          
          reset();
          push();
          pop();
          
        join 
        
   //chk();
  // tr.display("SCB");
          
      -> start;
		end
	endtask 
        
        
     
  task reset();
    if(tr.rst)
      
      foreach(que[i])
        que[i]=0;
  endtask
  
  
  task push();
    
    if(tr.push && !tr.full && !tr.rst)begin
      que.push_back(tr.d_in);
    
    $display("%p",que);
    end
	endtask
  
  task pop();
    
    if(tr.pop && !tr.empty && !tr.rst)begin
      //foreach (temp[i])begin
        
        temp = que.pop_front();
     
      $display("poped data:%d expected:%d",temp,tr.d_out);
      
      
      $display("%p",que);
      
    end
    
	endtask
  
/*  task chk();
    
    if(temp==tr.d_out)
    
      $display("#########  PASSED   ########");
    
    	else begin
          
          $display("poped data:%d | Expected:%d",temp,tr.d_out);
          $display("########  FAILED  #########");
        end
  	endtask  */  
			
endclass
        
    
