# sv-updown-counter

```markdown
# 4-bit UP/DOWN Counter — SystemVerilog enum FSM

![waveform](waveform.png)

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

## Run it yourself
Open in EDA Playground: <paste your saved-link URL here>
Or: paste the two .sv files, select Icarus Verilog + SystemVerilog,
tick "Open EPWave after run", click Run.
```

3. **Add files with separate commits** (this is what creates a professional history):
   - `Add file → Create new file` → name it `rtl/updown_counter.sv` (typing the `/` creates the folder) → paste design → commit: `add RTL for enum-based updown counter`
   - Same for `tb/updown_counter_tb.sv` → commit: `add self-checking testbench`
   - Same for `sim/test_output.txt` (paste the log) → commit: `add simulation log`
   - `Add file → Upload files` → drag your waveform PNG and the report PDF → commit: `add waveform and report` — wait, put the PDF in `docs/`? Upload can't create folders, so for the PDF use "Create new file" trick? It's binary, so no. **Simplest:** upload both files at root, then in README reference the image as `![](waveform.png)` and skip the `docs/` line, or just move on — a flat repo is fine too. Don't over-engineer.
4. **EDA Playground link:** back on your run, click **Save** (top), copy the URL, paste into the README where indicated.
5. **Pin it:** your profile → "Customize your pins" → add this repo.
6. **Test the link in an incognito window.**

✅ **Done when:** incognito shows the repo with README + waveform image rendering, ≥4 commits in history.

---

**Start Step 1 right now.** Run it, and tell me what the console prints — if all 20 pass, say "done" and move to Step 2; if anything fails, paste the output and I'll debug it with you.
