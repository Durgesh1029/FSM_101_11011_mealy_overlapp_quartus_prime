# Non-Overlapping Mealy Sequence Detectors (101 & 11011)

This repository contains Verilog implementations of two classic non-overlapping sequence detectors using the **Mealy FSM** architecture, synthesized and visualized using **Intel Quartus Prime Lite Edition**.

---

## 📌 Projects Overview

### 1. `101` Sequence Detector
* **FSM Model:** Mealy (Non-Overlapping)
* **States:** 
  * `Idle_S101` (`2'b00`): Reset / waiting for first `'1'`
  * `S1` (`2'b01`): Detected `'1'`
  * `S10` (`2'b10`): Detected `'10'`
* **Detection:** When in state `S10` and input `din = 1`, output `dout = 1` and FSM resets to `Idle_S101`.

### 2. `11011` Sequence Detector
* **FSM Model:** Mealy (Non-Overlapping)
* **States:** 
  * `Idle_S11011` (`3'b000`): Reset / waiting for initial sequence
  * `S1` (`3'b001`): Detected `'1'`
  * `S11` (`3'b010`): Detected `'11'`
  * `S110` (`3'b011`): Detected `'110'`
  * `S1101` (`3'b100`): Detected `'1101'`
* **Detection:** When in state `S1101` and input `din = 1`, output `dout = 1` and FSM resets to `Idle_S11011`.

---

## 🛠️ Toolchain & Analysis

* **Tool:** Intel Quartus Prime Lite Edition
* **Target Family:** Cyclone V (5CGXFC7C7F23C8)
* **Key Visualizers Used:**
  * **State Machine Viewer:** `Tools > Netlist Viewers > State Machine Viewer` (verifies transition bubbles and encoding tables)
  * **RTL Viewer:** `Tools > Netlist Viewers > RTL Viewer` (inspects synthesized D flip-flops, multiplexers, and logic gates)

---

## 📂 Repository Structure

```text
├── rtl/
│   ├── seq_101_mealy_nonoverlap.v     # 101 sequence detector
│   └── mealy_11011_nonoverlap.v       # 11011 sequence detector
├── doc/
│   ├── fsm_101_state_viewer.png       # Quartus state machine diagram for 101
│   ├── fsm_11011_state_viewer.png     # Quartus state machine diagram for 11011
│   └── rtl_viewer.png                 # RTL gate-level schematic
└── README.md
```
**Author:** Durgesh Dongre

*Exploring Digital VLSI Design, RTL Development, and Hardware Verification.*

---

## 💡 Key Design Notes

* **Mealy Architecture:** Output is combinational on both the current state and input (`din`), producing the detection flag immediately in the clock cycle where the final bit arrives.
* **Non-Overlapping Behavior:** Once the complete sequence is detected, the next state returns directly to `Idle` rather than retaining shared prefix bits.
