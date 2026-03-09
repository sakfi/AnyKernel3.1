#!/bin/bash
# scripts/validate.sh
# Validates line endings, bash syntax, and binary execution bits

set -e

echo "Starting AnyKernel3 validation..."

# 1. CRLF Detection
echo "Checking for CRLF line endings in critical scripts..."
if grep -qU $'\x0D' anykernel.sh tools/ak3-core.sh banner META-INF/com/google/android/updater-script META-INF/com/google/android/update-binary build-release.sh scripts/validate.sh; then
    echo "ERROR: CRLF line endings detected in critical text files!"
    echo "Please normalize to LF before releasing."
    exit 1
else
    echo "✓ Line endings look clean (LF)."
fi

# 2. Syntax Check
echo "Running bash syntax checks..."
if bash -n anykernel.sh && bash -n tools/ak3-core.sh && bash -n build-release.sh && bash -n scripts/validate.sh; then
    echo "✓ Bash syntax tests passed."
else
    echo "ERROR: Bash syntax error detected!"
    exit 1
fi

# 3. Executable Bits Check (Optional in Git if preserved, but good practice)
echo "Checking execution permissions..."
if ! [ -x "tools/magiskboot" ] || ! [ -x "tools/busybox" ]; then
    echo "ERROR: Core binaries in tools/ do not have executable permissions (+x)."
    echo "This will break the flash completely. Ensure permissions are preserved."
    exit 1
else
    echo "✓ Binary execution permissions detected."
fi

echo "Validation complete!"
exit 0
