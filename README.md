# Batch add barcodes to item records 

## Macro to add barcodes on Innovative Sierra Desktop via CSV

### Setup:
1. Prepare a csv (comma-separated) file with two columns: record-number and barcode, in the macro folder.
  - *file must be named "list.csv"*

### In Sierra:
1. Start and login to Sierra.
1. In the search bar, ensure the index dropdown is selected (the cursor should not be in the search box).
1. Activate the macro (double-click *add-barcodes.ahk*). **Expect no visible result, this action is merely loading the macro for execution**.
    -- it may be necessary to run the macro as an administrator: instead of double-clicking, right-click on *add-barcodes.ahk* and select `Run as Administrator`.
1. Start the macro by pressing keys CTRL+M (interrupt any time with ESCAPE key).
1. Watch it run, any hiccups/errors will be reported with a popup dialog and immediate termination of the macro.

**Macro requires dedicated desktop environment, any key presses or clicks during run-time could result in error/termination**
