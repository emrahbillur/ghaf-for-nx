<!--
    Copyright 2022-2023 TII (SSRC) and the Ghaf contributors
    SPDX-License-Identifier: CC-BY-SA-4.0
-->

# TII SSRC Secure Technologies: Ghaf Framework for Orin Nx

[![License: Apache-2.0](https://img.shields.io/badge/License-Apache--2.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0) [![License: CC-BY-SA 4.0](https://img.shields.io/badge/License-CC--BY--SA--4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/legalcode) [![Style Guide](https://img.shields.io/badge/docs-Style%20Guide-blueviolet)](https://github.com/tiiuae/ghaf/blob/main/docs/style_guide.md)

This repository contains the source files (code and documentation) of Orin Nx port of the Ghaf Framework — an open-source project for enhancing security through compartmentalization on edge devices.
Other repositories that are a part of the Ghaf project:

* <https://github.com/tiiuae/sbomnix>: a utility that generates SBOMs given Nix derivations or out paths
* <https://github.com/tiiuae/ci-public>: CI/CD related files


### Documentation
The only difference between original Ghaf framework is that a new target for Orin Nx platform is added. 

The build stage is 

#### Run the command:

nix build github:tiiuae/ghaf#nvidia-jetson-orin-nx-debug-flash-script 

It will build the Ghaf image and bootloader firmware, and prepare the flashing script. Give "yes" answers to all script questions. The building process takes around 1,5 hours.
Here we do not use the flash command directly as the Orin NX does not have local EMMC but find the nixos-disk-image created and use

dd if=./nix/store/......<somedirectory>-nixos-disk-image/nixos.img of=/dev/<YOUR_USB_DRIVE> bs=32M
  
to write image on USB or other device.
  
Scripts will be upgraded to directly copy image to storage


## Licensing

The Ghaf team uses several licenses to distribute software and documentation:

| License Full Name | SPDX Short Identifier | Description |
| -------- | ----------- | ----------- |
| Apache License 2.0 | [Apache-2.0](https://spdx.org/licenses/Apache-2.0.html) | Ghaf source code. |
| Creative Commons Attribution Share Alike 4.0 International | [CC-BY-SA-4.0](https://spdx.org/licenses/CC-BY-SA-4.0.html) | Ghaf documentation. |

See [LICENSE.Apache-2.0](./LICENSES/LICENSE.Apache-2.0) and [LICENSE.CC-BY-SA-4.0](./LICENSES/LICENSE.CC-BY-SA-4.0) for the full license text.
