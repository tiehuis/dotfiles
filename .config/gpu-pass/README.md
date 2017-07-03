## Hardware

 - Intel I5 6500
 - Nvidia GTX 1060

## Enabling GPU-passthrough

Assumes you have modified your grub to enable iommu support.

```
./gpu-pass-enable
# reboot
./gpu-pass-vfio-bind
./gpu-pass-test
# should display on secondary screen
```

## Disabling GPU-passthrough

```
./gpu-pass-disable
# reboot
```
