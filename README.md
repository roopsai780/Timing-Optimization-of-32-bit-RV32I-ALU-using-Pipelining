1)  This project implements a 32-bit RISC-V ALU (RV32I subset) and performs Static Timing Analysis (STA) using Vivado. The objective is to analyze the critical         path delay of a non-pipelined design and compare it with a pipelined implementation to observe performance improvement.

2)  The ALU supports the following RV32I R-type operations:
    ADD
    SUB
    AND
    OR
    XOR
    SLL
    SRL
    SRA
    SLT


3) The datapath consists of: opcode/funct → Decoder → ALU → Register


4) Static Timing Analysis (STA):Static Timing Analysis verifies whether the combinational logic between registers completes within one clock period.


5) Given a clock constraint:
    create_clock -period 10.000 [get_ports clk]

6) The design is evaluated for:
    Setup slack
    Hold slack
    Critical path delay
    Maximum operating frequency


7) Non-Pipelined Design
    In the non-pipelined version, the decoder and ALU logic are placed in the same clock cycle.
    Critical path:Input → Decoder → ALU → Output Register
    Measured delay: ~10.34 ns
    Maximum Frequency: ≈ 96 MHz


8) Pipelined Design
    A pipeline register is inserted between the decoder and ALU:
    Decoder → Register → ALU → Register
    This splits the logic across two clock cycles, reducing the combinational delay per stage.
    Measured delay: ~6.51 ns
    Maximum Frequency: ≈ 153 MHz

| Design Type   | Critical Path | Max Frequency |
| ------------- | ------------- | ------------- |
| Non-Pipelined | 10.34 ns      | ~96 MHz       |
| Pipelined     | 6.51 ns       | ~153 MHz      |


The pipelined design achieves approximately 58% improvement in maximum operating frequency.
