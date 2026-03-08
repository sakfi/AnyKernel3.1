### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

# AnyKernel setup
# global properties
properties() { '
kernel.string=SakFi OP Kernels by sakfi
# Set do.devicecheck=1 to enable device validation. Requires device.nameX configs below.
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=1
# Add supported device codenames here when do.devicecheck=1 (e.g. device.name1=OnePlus12)
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
# Add OS ranges when strict checking is needed (e.g. supported.versions=11.0.0-14.0.0)
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot shell variables
block=boot
is_slot_device=auto
ramdisk_compression=auto
patch_vbmeta_flag=auto
no_magisk_check=1

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh

# --- Wild Kernels Custom GKI Compatibility Logic ---
SUPPORTED_GKI_VERSIONS=("5.1.*" "6.1.*" "6.6.*")

check_gki_compatibility() {
    local current_kernel_ver=$(cat /proc/version | awk -F '-' '{print $1}' | awk '{print $3}')
    local is_supported=false
    
    for supported_ver in "${SUPPORTED_GKI_VERSIONS[@]}"; do
        # Use bash pattern matching against the wildcard string
        if [[ "$current_kernel_ver" == $supported_ver ]]; then
            is_supported=true
            break
        fi
    done

    ui_print " " "  -> SakFi OP Kernels Supported: $is_supported"
    
    if [ "$is_supported" = false ]; then
        local allowed_list="${SUPPORTED_GKI_VERSIONS[*]}"
        abort "  -> Unsupported kernel version ($current_kernel_ver). This GKI build requires: $allowed_list. Aborting."
    fi
}

# Run the compatibility check
check_gki_compatibility


# boot install
split_boot
if [ -f "split_img/ramdisk.cpio" ]; then
    unpack_ramdisk
    write_boot
else
    flash_boot
fi

ui_print " "
ui_print "Flashing Done! Good Luck with your new Kernel!!"
