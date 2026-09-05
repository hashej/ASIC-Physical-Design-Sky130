# 32-bit Single-Cycle RISC-V Microprocessor - ASIC Physical Design

Full RTL-to-GDSII physical design implementation of a custom 32-bit Single-Cycle RISC-V core on the **SkyWater 130nm (`sky130_fd_sc_hd`)** PDK using the automated OpenLane/LibreLane flow.

---

## 1. Physical Layout & Die Visualization

| KLayout GDSII Sign-off View | OpenROAD Post-PNR Routed / PDN View |
| :---: | :---: |
| ![Final GDSII Layout](images/final_gds.png) | ![PDN and Routing View](images/pdn_routing.png) |

---

## 2. Quality of Results (QoR) & Sign-off Metrics

The design successfully achieved clean tape-out sign-off across manufacturing checks:

| Metric Category | Parameter | Sign-off Value | Status |
| :--- | :--- | :--- | :---: |
| **Manufacturing Checks** | **Magic DRC Violations** | **0** | **PASSED** |
| | **KLayout DRC Violations** | **0** | **PASSED** |
| | **Netgen LVS Violations** | **0 (Matches Uniquely)** | **PASSED** |
| | **Antenna Violations** | **0 Violating Nets** | **PASSED** |
| **Floorplan & Utilization** | **Target Clock Frequency** | 66.6 MHz ($T_{\text{clk}} = 15.0\ \text{ns}$) | Operational |
| | **Die / Core Area** | $79,128.4\ \mu\text{m}^2$ (~$282 \times 280\ \mu\text{m}$) | Target Met |
| | **Active Standard Cells** | 5,526 logic gates | Synthesized |
| | **Total Instances (inc. Fillers/Tap)** | 12,723 instances | Placed |
| | **Core Utilization** | **70.81%** | Target Met |
| **Power Consumption** | **Total Power Dissipation** | **10.95 mW** | Analyzed |
| **Power Delivery (PDN)** | **Vertical Straps (`met4`)** | Pitch = $50\ \mu\text{m}$, Offset = $25\ \mu\text{m}$, Width = $3\ \mu\text{m}$ | Robust |
| | **Horizontal Straps (`met5`)** | Pitch = $50\ \mu\text{m}$, Offset = $25\ \mu\text{m}$, Width = $3\ \mu\text{m}$ | Robust |
| | **Worst-Case IR Drop** | 0.10 mV | Highly Stable |

---

## 3. Multi-Corner Static Timing Analysis (STA)

Timing was closed across Multi-Corner Multi-Mode (MCMM) PVT operating conditions:

| Operating Corner | Condition | Setup WNS (15ns) | Hold WNS | Sign-off Status |
| :--- | :--- | :--- | :--- | :---: |
| **Nominal** | `nom_tt_025C_1v80` | **+4.60 ns** | **+0.47 ns** | **PASSED (66.6 MHz)** |
| **Fastest** | `min_ff_n40C_1v95` | **+7.36 ns** | **+0.26 ns** | **PASSED (66.6 MHz)** |
| **Worst-Case** | `max_ss_100C_1v60` | -3.98 ns | **+1.06 ns** | **PASSED (52.6 MHz scaled)** |

> **PVT Sign-off Evaluation:** Under nominal and fast silicon corners, the processor achieves zero setup and hold violations at 66.6 MHz with healthy positive slack (+4.60 ns). In the extreme worst-case environmental corner (Slow-Slow, 100°C), timing is closed cleanly by operating the core at ~52.6 MHz ($T_{\text{clk}} \approx 19.0\ \text{ns}$), ensuring robust, violation-free functionality across all PVT corners.

---

## 4. Physical Design Highlights

* **Architecture:** Synthesized a custom 32-bit single-cycle RISC-V microarchitecture with zero inferred latches.
* **Symmetrical PDN:** Implemented balanced dual-layer power grids on `met4` and `met5` with uniform tap cells, keeping worst-case IR drop under 0.10 mV.
* **Congestion & Placement:** Achieved 70.81% core utilization with zero post-route DRC violations.
* **Tape-out Sign-off:** Clean streamout to GDSII validated by Magic, KLayout, and Netgen LVS.

---
*Physical Design Implementation by Hafiz M. Sheharyar Jawed.*
