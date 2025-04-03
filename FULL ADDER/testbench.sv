// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "test.sv"
module testbench;
  intf intff();
  test tst(intff);
  
  full_adder FA(.a(intff.a),
                .b(intff.b),
                .c(intff.c),
                .sum(intff.sum),
                .carry(intff.carry));
endmodule
                
