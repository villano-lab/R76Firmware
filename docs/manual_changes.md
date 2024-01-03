Don't blindly overwrite everything when SCI-Compiler is done and you're getting ready to commit/push changes.
Because we are storing things where SCI-Compiler writes out its data, it's going to make a lot of changes that we don't want to keep, including deleting custom code.
Some instructions are below. Keep in mind that line numbers may change from time of writing and are more of a rough guide than actual values.
1. Undelete all files deleted by SCI-Compiler.
2. Always KEEP all changes to any RegisterFile. The registers SHOULD change each time and they cannot be easily manually generated or edited without causing issues.
3. Discard changes to the `Makefile`.
4. Carefully analyze changes to other files within the `src` directory. Some files are not generated correctly. You may be able to discard changes -- if not, manually merge them. (Please update this document with more details about these changes.) This step can be done when attempting to `make` if you miss any steps.
  * Enforce type conversions wherever `malloc` appears with the syntax `(type)malloc(...)`. This is present in `Legacy/circular_buffer.c` and `Legacy/R76Firmware_lib.c`.
  * Fix type conversions by replacing instances of `int32_t` with `uint32_t` in `Legacy/circular_buffer.c` and `Legacy/R76Firmware_lib.c`. (These are easiest to catch as line-by-line changes, or at compile time -- don't stress if you can't find them all.)
  * In `Legacy/R5560_SDKLib.h`, toward the beginning, comment out all `__declspec(dllimport)` or `__declspec(dllexport)`. This is Windows code that we do not need and it will interfere with our compiler. DO  NOT COMMENT OUT THE ENTIRE LINE, just the end where it says `__declspec(dll...`
  * In `Legacy/R76Firmware_lib.c`, at line ~360, fix the type of the variable `buffer_handle` in `ClearBuffer` from `void *` to `cbuf_handle_t`.
  * In `Legacy/R76Firmware_lib.c`, at line ~219, fix the type of the variable `val` in `Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER` from `int32_t *` to `uint32_t`.
