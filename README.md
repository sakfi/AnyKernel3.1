# SakFi OP Kernels - AnyKernel3.1

This repository serves as the official kernel deployment package for **SakFi OP Kernels**. It is an automated, hardened flashing utility designed to deliver GKI-compatible Android kernels seamlessly.

## Features & Highlights
- **Universal GKI Support:** Dynamically queries and supports major GKI kernel versions before flashing (`5.1.*`, `6.1.*`, `6.6.*`), preventing incompatible cross-flashing algorithms.
- **KernelSU Next & SUSFS Native Integration:** Built-in hooks and execution paths structured for advanced root delivery and detection-hiding metrics.
- **Robust CI Automation:** Includes built-in GitHub Action workflows mapped to standard `scripts/validate.sh` verifications to mandate correct shell executions, syntactical accuracy, and LF line-ending hygiene across thousands of device matrices.
- **Upstream Resilience:** Safely isolates user customizations from core `ak3-core.sh` updates, maintaining synchronization sanity with original authors.

## Installation (Custom Recovery/Flasher)
1. Download the latest release `.zip` artifact from the linked repository releases.
2. Boot your device into your designated custom recovery (e.g., TWRP, OrangeFox) or utilize a Kernel Flasher application natively.
3. Flash the `.zip` archive.
   *The installer automatically handles ramdisk extraction, KernelSU injection, boot repacking, and environment cleanup!*
4. Reboot into the updated Android System.

## Packaging & Releases
Instead of tedious manual labor, repository maintainers can generate guaranteed release zip artifacts directly.
```bash
./build-release.sh
```
Executes local testing suites and deterministically compiles the `WildKernels-AnyKernel3-[Version].zip` with a matching `.sha256` artifact.

## Credits & Acknowledgements
This repository would not exist without the dedication of the underlying developers.
- **osm0sis**: Original creator of the expansive [AnyKernel3 backend](https://github.com/osm0sis/AnyKernel3).
- **TheWildJames / Morgan Weedman**: Core custom [Wild Kernels packaging logic](https://github.com/TheWildJames/AnyKernel3).
- **fatalcoder524**: OnePlus KernelSU & SUSFS workflow integrations.
- **sidex15 and simonpunk**: Creators of the SUSFS modules modifying native filesystem hooks.
