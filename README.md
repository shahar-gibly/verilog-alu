# Verilog ALU Project

This project implements a simple **Arithmetic Logic Unit (ALU)** in Verilog.  
The ALU supports arithmetic, logic, and shift operations, with status flags.

## Features
- Parametric bit-width (`N`, default 4/8 bits)
- Operations:
  - ADD, SUB (with Carry, Overflow)
  - AND, OR, XOR, NOT
  - Logical Shift Left / Right
  - Arithmetic Shift Right (SRA)
- Status Flags:
  - **Z** – Zero  
  - **N** – Negative (sign bit)  
  - **C** – Carry / Borrow  
  - **V** – Overflow  

## File Structure


## How to Run
1. Compile with Icarus Verilog:
    iverilog -o sim.out ./src/alu.v ./tb/tb_alu.v
2. Run simulation:
    vvp sim.out
3. View waveforms (optional):
    gtkwave waves.vcd
    
## Example Output

    time | A B op | Y | Z N C V
1000 | 0101 0010 0000 | 0111 | 0 0 0 0 (ADD)
2000 | 0101 0010 0001 | 0011 | 0 0 1 0 (SUB)

