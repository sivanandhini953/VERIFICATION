interface intf();
  
  bit clk;
  logic rst;
  logic [3:0]count;
  logic up_down;
  
  clocking drv_cb@(posedge clk);
    default output #1;
    output rst;
    output up_down;
    
  endclocking
  
  clocking mon_cb@(posedge clk);
    
    input rst;
    input up_down;
    input count;
    
  endclocking
  
  modport DRI_INF(clocking drv_cb,input clk);
    modport MON_INF(clocking mon_cb,input clk);
    
  
endinterface
