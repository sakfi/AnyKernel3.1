# Upstream Sync Checklist

Because `AnyKernel3` is heavily templated, we aim to minimize drift from the core repository so that future updates from `osm0sis` (the original creator) remain easy to merge.

## Core "Vendor Upstream" Files
The following files should **NOT** have custom logic embedded within them unless strictly necessary. All custom kernel checks, device gating, or flash logic should be concentrated inside `anykernel.sh` natively.

- `tools/ak3-core.sh`: The core bash driver.
- `META-INF/com/google/android/update-binary`: The recovery execution script.

## Syncing Updates
When pulling updates from the original [AnyKernel3 upstream](https://github.com/osm0sis/AnyKernel3):

- [ ] Check `tools/ak3-core.sh` for conflict paths. Resolve them by keeping upstream logic.
- [ ] Check `META-INF/com/google/android/update-binary` for conflict paths.
- [ ] Check if `tools/magiskboot` or `tools/busybox` received binary updates. If so, pull the new static binaries.
- [ ] Run the local validation script `bash scripts/validate.sh` to ensure CRLF line endings didn't accidentally slip in with the upstream pull.
- [ ] Test a local Zip build using `./build-release.sh`.
- [ ] Perform a pre-release dry flash on a physical device.
