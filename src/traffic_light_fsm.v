`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: The University of Texas at El Paso
// Engineer: Vianney Diaz
// 
// Create Date: 11/12/2025 09:26:55 AM
// Design Name: 
// Module Name: traffic_light_fsm
//////////////////////////////////////////////////////////////////////////////////


module traffic_light_fsm(
    input clk, V, Z,
    output reg [11:0] lights
    );
    
    reg [2:0] present_state;
    reg [2:0] next_state;
    
    parameter s0 = 3'b000,
    s1 = 3'b001,
    s2 = 3'b010,
    s3 = 3'b011,
    s4 = 3'b100,
    s5 = 3'b101,
    s6 = 3'b110,
    s7 = 3'b111;
    
    //define clk
    always @(posedge clk)
    present_state <= next_state;
    
    //define next state 
    always @(present_state or V or Z)
        case(present_state)
            s0: next_state = s1;
            s1: next_state = s2;
            s2: next_state = s3;
            s3: if (V) next_state = s4; else if (Z) next_state = s6; else next_state = s0;
            s4: next_state = s5;
            s5: next_state = s0;
            s6: next_state = s7;
            s7: next_state = s0;
            default: next_state = s0;
        endcase
        
    always @(present_state)
        case (present_state)
            s0: lights <= 12'h849;
            s1: lights <= 12'h449;
            s2: lights <= 12'h309;
            s3: lights <= 12'h289;
            s4: lights <= 12'h261;
            s5: lights <= 12'h251;
            s6: lights <= 12'h24C;
            s7: lights <= 12'h24A;
            default: lights <= 12'h000;
        endcase 
    
endmodule