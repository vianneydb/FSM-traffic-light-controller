# Four-Way Traffic Light Controller FSM (Basys-3 FPGA – Verilog)
This project implements a **finite state machine (FSM)** that controls a **four-way traffic light** intersection using Verilog HDL on a Basys-3 FPGA.
It is a two-vehicle detection sensor (`V` and `Z`) that changes the traffic signals accordingly, following a synchronous state-based timing sequence.

## FSM behavior
The intersection includes:
- Main road (priority route)
- Secondary road #1, controlled by sensor `V`
- Secondary road #2, controlled by sensor `Z`

The FSM cycles through the main road traffic lights normally unless a sensor detects a vehicle:
- When the FSM reaches a specific state, it checks `V` or `Z`
- If a sensor = 1, the system temporarily redirects the green/yellow cycle to that road
- After completing the alternate cycle, the FSM returns to the main-road sequence

Traffic lights follow the standard order:
**Green → Yellow → Red**

## Architecture

#### `traffic_lights_fsm.v`
Implements the full finite state machine:
- State transitions for main and secondary roads
- Sensor-based branching logic
- Output logic for all traffic lights

## Tools Used
- Verilog HDL
- Xilinx Vivado
- Basys-3 FPGA development board

## Contributing
If you'd like to improve this project, feel free to fork the repository, make your changes, and submit a pull request.

**Author**: Vianney Diaz  
**Date**: November 2025
