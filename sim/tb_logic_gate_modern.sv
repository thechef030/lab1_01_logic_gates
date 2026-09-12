`timescale 1ns/1ps
module tb_logic_gate_modern;
  reg a,b; wire x,y,z; logic_gate dut(a,b,x,y,z);
  integer n,checked=0;
  reg [2:0] expected;
  initial begin
    $dumpfile("wave.vcd"); $dumpvars(0,tb_logic_gate_modern);

    for(n=0;n<4;n=n+1) begin
      {a,b}=n;
      expected={(a & b),(a | b),(a ^ b)};
      #10;
      if ({x,y,z} !== expected)
        $fatal(1,"FAIL logic_gate vector=%0d expected=%h actual=%h",n,expected,{x,y,z});
      checked=checked+1;
    end
    if(checked!=4) $fatal(1,"Incomplete test");
    $display("LAB1_PASS logic_gate cases=%0d",checked);
    $finish;
  end
  initial begin #100000; $fatal(1,"Watchdog"); end
endmodule
