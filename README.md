# sv-updown-counter


# 4-bit UP/DOWN Counter — SystemVerilog enum FSM


**Result: 20/20 self-checks pass** — including the required double-4
(6 → 5 → 4 → 4 → 3) and the DOWN wrap (0 → 15).

## Behavior
- Synchronous active-high reset; `up_down` selects direction.
- UP:   0 → 1 → … → 15 → 0
- DOWN: … → 6 → 5 → 4 → 4 → 3 → 2 → 1 → 0 → 15
  (value 4 held for two cycles via the ST_HOLD_4 state)

## Files
- `rtl/updown_counter.sv` — design
- `tb/updown_counter_tb.sv` — self-checking testbench
- `sim/test_output.txt` — full simulation log
- `docs/report.pdf` — project report
