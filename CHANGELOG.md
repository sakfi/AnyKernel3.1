# Changelog

All notable changes to the Wild Kernels flashing utility will be documented in this file.

## [Unreleased]
### Added
- GitHub Actions CI to strictly enforce `LF` line endings and shell script integrity.
- Automated release generation script `build-release.sh` with sha256 checksumming capabilities.
- Added comprehensive documentation (`README.md`, `CHANGELOG.md`, `upstream_sync_checklist.md`).
- Centralized GKI Array Allowlist mapping (`SUPPORTED_GKI_VERSIONS`).
- Comprehensive parameter configurations in `anykernel.sh` for fine-tuning dynamic validations.

### Fixed
- Fixed trailing quote character in the updater `banner` resolving broken telegram links.
- Normalized existing binaries, shell codes, and config maps from CRLF environments to pristine LF mapping.
- Hardened abort routines checking specifically for major kernel trees instead of raw string failures.
