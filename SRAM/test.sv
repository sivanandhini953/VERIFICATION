
`include "environment.sv"

program test(intf sr);
  environment env;
  initial begin
    env=new(sr);
    env.main();
  end
endprogram
