`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: The University of Texas at El Paso
// Engineer: Vianney Diaz
// 
// Create Date: 11/12/2025 10:29:33 AM
// Design Name: 
// Module Name: fsm_sim1
//////////////////////////////////////////////////////////////////////////////////


module fsm_sim1;
reg clk;
reg V;
reg Z;
wire [11:0] lights;
wire [2:0] present_state;
wire [2:0] next_state;

traffic_light_fsm uut(
.clk(clk),
.V(V),
.Z(Z),
.present_state(present_state),
.next_state(next_state),
.lights(lights)
);

    initial begin
    clk = 0; V = 0; Z = 0;
    #150;
    
    V = 1;
    #80;
    
    V = 0; Z = 1;
    #50;
    
    Z = 0;
    #150;
    end 
    
    always #10 clk = ~clk;
    
endmodule
