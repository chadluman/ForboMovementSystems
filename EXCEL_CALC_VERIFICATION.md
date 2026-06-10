# Excel Calculation Verification

Source workbook: `forbo Fullsan Quote Request Form.xlsm`

## Verified Calculation Structure

The workbook contains VBA forms and worksheet formulas. The VBA does not directly calculate the main pull-force result; it writes form input values into worksheet cells and then reads calculated worksheet outputs.

Key verified path:

- `PullForce.frm`
  - `RunCalc()` writes inputs to `PFcalc` cells such as `I7`, `I8`, `I9`, `I10`, `I16`, `I17`, `I22`, `I27`, `I30`, `I32`, `I35`, `I40`, and `I43`.
  - The form reads calculated outputs from `PFcalc!I36` and `PFcalc!I38`.
- `PFcalc` worksheet
  - `H51` calculates effective pull from load, geometry, friction, and conveyor direction inputs.
  - `C64` calculates pull per belt width using `ROUND(10*H51/I17,2)`.
  - Rows `D67:D72` generate warnings/recommendations when pull exceeds available capacity.
- `CalcSheet` and `QUOTE_CSR`
  - `CalcSheet` builds quote descriptions, component dimensions, and derived line text.
  - `QUOTE_CSR` pulls quote header/detail output from `CalcSheet`.

## Browser Implementation

The site now includes a browser-safe pull-force estimate in the quote app modal. It is not executing Excel/VBA. It uses the verified workbook flow as a source model and calculates:

- effective pull in newtons
- pull per belt width in N/mm
- comparison against salesperson-entered allowable pull
- missing-input warnings

The downloaded quote JSON includes the calculation inputs, outputs, and the source note:

`Excel-derived browser estimate from PullForce.RunCalc input mapping and PFcalc pull-force formulas H51/C64.`

## Limits

Excel is not installed in this environment, so the workbook itself could not be recalculated by Excel. The workbook formulas were inspected directly from the `.xlsm` file. The VBA analyzer also flagged possible VBA stomping, so the macro code was treated as reference material only and was not executed.
