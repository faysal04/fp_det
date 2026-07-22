# Vigil: Line-Rate Fingerprint Detection for TCP-SYN Scanning on FPGAs

`Vigil` is a High-Throughput FPGA architecture for real-time TCP-SYN scan detection.

The project was developed as part of research on FPGA-based network security acceleration, where TCP-SYN packet fingerprints are converted into synthesizable hardware modules capable of detecting known scanning patterns at line rate.

---

# Features

- FPGA-based real-time TCP-SYN fingerprint detection
- Configurable Ethernet MAC supporting **10 Mbps / 100 Mbps / 1 Gbps**
- 10G Ethernet MAC with **XGMII** interface
- Python-based RTL generator for automatic SystemVerilog generation
- Automatic top-level wrapper generation
- Automatic module instantiation template generation
- Automatic SystemVerilog filelist generation

---

# Repository Structure

```
fp_det/
├── generator/         # Python-based RTL generator and generated files
├── xgmii_rtl/         # Virtex 6 Project files
├── xgmii_rtl/         # 10G Ethernet MAC (XGMII)
├── sv files           # 10M/100M/1G Ethernet MAC
└── README.md
```

---

# Design Components

## MAC

A configurable Ethernet MAC supporting:

- 10 Mbps
- 100 Mbps
- 1 Gbps

Interfaces:

- GMII
- MII

---

## MAC 10G

A 10 Gigabit Ethernet MAC implementation supporting the **XGMII** interface.

---

## Generator

The Generator is a Python-based SystemVerilog code generator that converts TCP fingerprint definitions into synthesizable RTL.

It automatically:

- Parses fingerprint expressions
- Generates one SystemVerilog module per fingerprint
- Creates a top-level wrapper module
- Instantiates all generated fingerprint modules
- Generates a SystemVerilog include filelist
- Produces an instantiation template for easy integration

---

# Updating the Fingerprints

Change to the generator directory:

```bash
cd generator
```

Edit the `fingerprint.txt` file.

## Basic Expression Format

Each individual condition must be enclosed in parentheses.

Example:

```text
(tcp.window == 14600)
```

Multiple conditions can be combined using standard logical operators.

Example:

```text
(tcp.seq == 3000) && (tcp.window == 65535)
```

The generator supports all arithmetic, relational, bitwise, and logical operators supported by SystemVerilog.

---

# Custom Functions

The generator also supports custom functions.

These functions must be implemented inside the Python generator so that they can be translated into equivalent SystemVerilog expressions.

One example already implemented is:

```text
fL2B(signal)
```

which returns the lower 16 bits (2 bytes) of a signal.

Example:

```text
(fL2B(ip.dst) ^ tcp.dport) == 0
```

Before RTL generation, the generator expands this expression into:

```text
(ip.dst[15:0] ^ tcp.dport[15:0]) == 0
```

The resulting expression is then used to generate synthesizable SystemVerilog logic.

---

# Generating RTL

After updating `fingerprint.txt`, run:

```bash
python generator.py
```

---

# Generated Output

The generator creates one SystemVerilog module for every fingerprint in `fingerprint.txt`.

Additionally, it generates the following files.

## 1. Top Module

A wrapper module that:

- Instantiates every generated fingerprint module
- Assigns a dedicated 16-bit counter to each fingerprint
- Exposes a unified interface for integration

---

## 2. Instantiation Template

A ready-to-use template showing how to instantiate the generated top module inside another design.

---

## 3. `filelist.sv`

A SystemVerilog include file containing references to all generated RTL files.

This file can be directly included in your simulator or synthesis filelist.

---

# Workflow

```text
fingerprint.txt
        │
        ▼
generator.py
        │
        ├── Fingerprint Module 0
        ├── Fingerprint Module 1
        ├── Fingerprint Module 2
        ├── ...
        │
        ├── Top Module
        ├── Instantiation Template
        └── filelist.sv
```

---

# Requirements

- Python 3.0 or above
- FPGA development environment (Vivado)
