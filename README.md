# Floating-Point Processing Unit (FPU)

This repository contains a Verilog implementation of a Floating-Point Processing Unit (FPU) designed for arithmetic operations such as addition, subtraction, and multiplication. The FPU is modular and supports multiple cores for parallel processing.

---

## Table of Contents

- [Overview](#overview)
- [Modules](#modules)
  - [FP_adder_13ccs](#fp_adder_13ccs)
  - [FP_multiplier_10ccs](#fp_multiplier_10ccs)
  - [FP_subtractor_13ccs](#fp_subtractor_13ccs)
  - [FP_datapath](#fp_datapath)
  - [fppu](#fppu)
  - [quad_core](#quad_core)
  - [shift13_register](#shift13_register)
  - [shift23_register](#shift23_register)
  - [timing_ctl](#timing_ctl)
  - [fpu](#fpu)
- [Usage](#usage)
- [License](#license)

---

## Overview

The FPU is designed to perform floating-point arithmetic operations efficiently. It includes the following key modules:

1. **FP_adder_13ccs**: A 13-cycle floating-point adder.
2. **FP_multiplier_10ccs**: A 10-cycle floating-point multiplier.
3. **FP_subtractor_13ccs**: A 13-cycle floating-point subtractor.
4. **FP_datapath**: A datapath that integrates the adder, multiplier, and subtractor for sequential operations.
5. **fppu**: A top-level module that instantiates two FPU cores for parallel processing.
6. **quad_core**: A module that instantiates four FPU cores for parallel processing.
7. **shift13_register**: A 13-stage shift register for pipelining data.
8. **shift23_register**: A 23-stage shift register for pipelining data.
9. **timing_ctl**: A timing control module for managing the enable signals and valid signals for the FPU operations.
10. **fpu**: A top-level module that integrates the FPU datapath, shift registers, and timing control for a complete FPU implementation.

---

## Modules

### FP_adder_13ccs

A 13-cycle floating-point adder that takes two 32-bit floating-point inputs (`io_in_a` and `io_in_b`) and produces a 32-bit floating-point output (`io_out_s`). It supports enable signals (`io_in_en`) and reset functionality.

**Inputs:**
- `clock`: Clock signal.
- `reset`: Reset signal.
- `io_in_en`: Enable signal for the adder.
- `io_in_a`: First 32-bit floating-point input.
- `io_in_b`: Second 32-bit floating-point input.

**Outputs:**
- `io_out_s`: 32-bit floating-point result of the addition.

---

### FP_multiplier_10ccs

A 10-cycle floating-point multiplier that takes two 32-bit floating-point inputs (`io_in_a` and `io_in_b`) and produces a 32-bit floating-point output (`io_out_s`). It supports enable signals (`io_in_en`) and reset functionality.

**Inputs:**
- `clock`: Clock signal.
- `reset`: Reset signal.
- `io_in_en`: Enable signal for the multiplier.
- `io_in_a`: First 32-bit floating-point input.
- `io_in_b`: Second 32-bit floating-point input.

**Outputs:**
- `io_out_s`: 32-bit floating-point result of the multiplication.

---

### FP_subtractor_13ccs

A 13-cycle floating-point subtractor that takes two 32-bit floating-point inputs (`io_in_a` and `io_in_b`) and produces a 32-bit floating-point output (`io_out_s`). It supports enable signals (`io_in_en`) and reset functionality.

**Inputs:**
- `clock`: Clock signal.
- `reset`: Reset signal.
- `io_in_en`: Enable signal for the subtractor.
- `io_in_a`: First 32-bit floating-point input.
- `io_in_b`: Second 32-bit floating-point input.

**Outputs:**
- `io_out_s`: 32-bit floating-point result of the subtraction.

---

### FP_datapath

A datapath module that integrates the floating-point adder, multiplier, and subtractor to perform sequential operations. It takes four 32-bit floating-point inputs (`a`, `b`, `c`, `d`) and produces a 32-bit floating-point output (`g`).

**Inputs:**
- `clk`: Clock signal.
- `rst`: Reset signal.
- `io_in_en_a`: Enable signal for the adder.
- `io_in_en_m`: Enable signal for the multiplier.
- `io_in_en_s`: Enable signal for the subtractor.
- `a`, `b`, `c`, `d`: 32-bit floating-point inputs.

**Outputs:**
- `g`: 32-bit floating-point result of the sequential operations.

---

### fppu

The top-level module that instantiates two FPU cores (`core0` and `core1`) for parallel processing. It takes eight 32-bit floating-point inputs (`a0`, `b0`, `c0`, `d0`, `a1`, `b1`, `c1`, `d1`) and produces two 32-bit floating-point outputs (`g0`, `g1`). It also provides finish signals (`fi0`, `fi1`) for each core.

**Inputs:**
- `clk`: Clock signal.
- `rst`: Reset signal.
- `en`: Enable signal for both cores.
- `a0`, `b0`, `c0`, `d0`: Inputs for the first core.
- `a1`, `b1`, `c1`, `d1`: Inputs for the second core.

**Outputs:**
- `g0`, `g1`: 32-bit floating-point results from the two cores.
- `fi0`, `fi1`: Finish signals indicating the completion of operations for each core.

---

### quad_core

A module that instantiates four FPU cores (`u0_fppu` and `u1_fppu`) for parallel processing. It takes sixteen 32-bit floating-point inputs (`a0`, `b0`, `c0`, `d0`, `a1`, `b1`, `c1`, `d1`, `a2`, `b2`, `c2`, `d2`, `a3`, `b3`, `c3`, `d3`) and produces four 32-bit floating-point outputs (`g0`, `g1`, `g2`, `g3`). It also provides finish signals (`fi0`, `fi1`, `fi2`, `fi3`) for each core.

**Inputs:**
- `clk`: Clock signal.
- `rst`: Reset signal.
- `en`: Enable signal for all cores.
- `a0`, `b0`, `c0`, `d0`: Inputs for the first core.
- `a1`, `b1`, `c1`, `d1`: Inputs for the second core.
- `a2`, `b2`, `c2`, `d2`: Inputs for the third core.
- `a3`, `b3`, `c3`, `d3`: Inputs for the fourth core.

**Outputs:**
- `g0`, `g1`, `g2`, `g3`: 32-bit floating-point results from the four cores.
- `fi0`, `fi1`, `fi2`, `fi3`: Finish signals indicating the completion of operations for each core.

---

### shift13_register

A 13-stage shift register used for pipelining data. It takes a 32-bit input and produces a 32-bit output after 13 clock cycles.

**Inputs:**
- `clk`: Clock signal.
- `rst`: Reset signal.
- `in`: 32-bit input data.

**Outputs:**
- `out`: 32-bit output data after 13 clock cycles.

---

### shift23_register

A 23-stage shift register used for pipelining data. It takes a 32-bit input and produces a 32-bit output after 23 clock cycles.

**Inputs:**
- `clk`: Clock signal.
- `rst`: Reset signal.
- `in`: 32-bit input data.

**Outputs:**
- `out`: 32-bit output data after 23 clock cycles.

---

### timing_ctl

A timing control module that generates enable signals (`io_out_en_a`, `io_out_en_m`, `io_out_en_s`) and valid signals (`add_vld`, `mul_vld`, `sub_vld`) for the FPU operations. It also provides a finish signal (`fi`) to indicate the completion of the operations.

**Inputs:**
- `clk`: Clock signal.
- `rst`: Reset signal.
- `en`: Enable signal for the timing control.

**Outputs:**
- `io_out_en_a`: Enable signal for the adder.
- `io_out_en_m`: Enable signal for the multiplier.
- `io_out_en_s`: Enable signal for the subtractor.
- `add_vld`: Valid signal for the adder.
- `mul_vld`: Valid signal for the multiplier.
- `sub_vld`: Valid signal for the subtractor.
- `fi`: Finish signal indicating the completion of operations.

---

### fpu

A top-level module that integrates the FPU datapath, shift registers, and timing control for a complete FPU implementation. It takes four 32-bit floating-point inputs (`a`, `b`, `c`, `d`) and produces a 32-bit floating-point output (`g`). It also provides a finish signal (`fi`) to indicate the completion of the operations.

**Inputs:**
- `clk`: Clock signal.
- `rst`: Reset signal.
- `en`: Enable signal for the FPU.
- `a`, `b`, `c`, `d`: 32-bit floating-point inputs.

**Outputs:**
- `g`: 32-bit floating-point result of the operations.
- `fi`: Finish signal indicating the completion of operations.

---

## Usage

To use the FPU in your Verilog project, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo/fpu.git
   ## Instantiate the Modules

2. **Instantiate**: `FP_adder_13ccs`, `FP_multiplier_10ccs`, or `FP_subtractor_13ccs`** for individual operations.
- **Use `FP_datapath`** for sequential operations involving addition, multiplication, and subtraction.
- **Use `fppu`** for parallel processing with two FPU cores.
- **Use `quad_core`** for parallel processing with four FPU cores.
- **Use `shift13_register` and `shift23_register`** for pipelining data.
- **Use `timing_ctl`** for managing the timing of FPU operations.
- **Use `fpu`** for a complete FPU implementation.

3. **Simulate and Synthesize**:

- Use your preferred Verilog simulator (e.g., ModelSim, Vivado) to simulate the modules.
- Synthesize the design for your target FPGA or ASIC.

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.
