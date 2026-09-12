module logic_gate(input wire a,b, output wire x,y,z);
    assign x = a & b; // AND gate;
    assign y = a | b; // OR gate;
    assign z = a ^ b; // XOR gate;
endmodule
