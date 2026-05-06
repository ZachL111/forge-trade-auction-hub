# Field Notes

This note keeps the trading systems assumptions visible beside the checks.

The domain cases cover `spread pressure`, `fill risk`, `portfolio drift`, and `quote width`. They sit beside the smaller starter fixture so the project has both a compact scoring check and a domain-flavored review check.

`baseline` is the strongest case at 236 on `spread pressure`. `recovery` is the cautious anchor at 144 on `quote width`.

The extra check gives the repository a behavior path that can fail for a domain reason, not only a syntax reason.
