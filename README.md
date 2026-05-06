# forge-trade-auction-hub

`forge-trade-auction-hub` is a compact Zig repository for trading systems, centered on this goal: Design a Zig verification harness for auction systems, covering simulation kernel, seeded input scenarios, and failure-oriented tests.

## Purpose

This is intentionally local and self-contained so it can be inspected without credentials, services, or seeded history.

## Forge Trade Auction Hub Review Notes

For a quick review, compare `spread pressure` with `quote width` before reading the middle cases.

## What Is Covered

- `fixtures/domain_review.csv` adds cases for spread pressure and fill risk.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/forge-trade-auction-walkthrough.md` walks through the case spread.
- The Zig code includes a review path for `spread pressure` and `quote width`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Implementation Notes

The core code exposes a scoring path and the added review layer uses `signal`, `slack`, `drag`, and `confidence`. The domain terms are `spread pressure`, `fill risk`, `portfolio drift`, and `quote width`.

The added Zig path is deliberately direct, with fixtures doing most of the explaining.

## Command

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Audit Path

That command is also the regression path. It verifies the domain cases and catches mismatches between the CSV, metadata, and code.

## Limits

The repository is intentionally scoped to local checks. I would expand it by adding adversarial fixtures before adding features.
