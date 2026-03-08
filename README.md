# Wild Kernels - AnyKernel3

This repository packages and delivers **Wild Kernels** for GKI compatible Android devices, leveraging KernelSU and SUSFS optimizations. This flashing package is built on top of [AnyKernel3 by osm0sis](https://github.com/osm0sis/AnyKernel3).

## Supported Kernels 
This installer dynamically queries the device kernel version before flashing. The following GKI branches are currently supported:
- **`5.1.*`**
- **`6.1.*`**
- **`6.6.*`**

*Attempting to flash this on a non-GKI Android device will result in a safetly-aborted flash.*

## Installation (Custom Recovery)
1. Download the latest release `.zip` from the Releases page.
2. Reboot your device into your custom recovery (TWRP, OrangeFox, etc.).
3. Flash the zip file.
   - The installer will automatically perform a boot image ramdisk backup and inject the new kernel alongside KernelSU implementations.
4. Reboot to System.

## Development & Building
To build a release safely:
```bash
./build-release.sh
```
This script automatically excludes testing metadata, generates the zip, and provides a SHA256 checksum suitable for release logs!

## Links
- [WildKernels Telegram](https://t.me/WildKernels)
- [WildKernels Website](https://wildkernels.dev)
- [Wild_KSU GitHub](https://github.com/WildKernels/Wild_KSU)
