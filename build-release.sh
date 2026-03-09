#!/bin/bash
# build-release.sh
# Deterministic zip creation for AnyKernel3 releases

set -e

# Version calculation
DATE_STR=$(date +%Y%m%d_%H%M)
ZIP_NAME="SakFi-OP-AnyKernel3-${DATE_STR}.zip"

echo "Building Release: $ZIP_NAME"

# 1. Validate environment before building
if [ -f "scripts/validate.sh" ]; then
    bash scripts/validate.sh
else
    echo "Warning: Validation script missing, skipping pre-checks."
fi

# 2. Package Creation
# We exclude git, documentation, scripts/ and the zip itself.
echo "Zipping contents..."
zip -r9 "$ZIP_NAME" . -x \*.git\* \*README.md \*CHANGELOG.md \*upstream_sync_checklist.md \*.gitattributes \*scripts/\* \*build-release.sh \*.zip \*.tgz \*temp_patches/\* \*temp_wildkernels_ak3/\*

# 3. Checksum Generation
echo "Generating SHA256 checksum..."
sha256sum "$ZIP_NAME" > "${ZIP_NAME}.sha256"

echo "Build Complete!"
echo "Artifact: $ZIP_NAME"
echo "Checksum: $(cat "${ZIP_NAME}.sha256")"
exit 0
