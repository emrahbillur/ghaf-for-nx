# Copyright 2022-2023 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
#
# Configuration for NVIDIA Jetson Orin Nx
{
  lib,
  config,
  ...
}: {
  hardware.nvidia-jetpack = {
    enable = true;
    som = "orin-nx";
    carrierBoard = "devkit";
    modesetting.enable = true;

    flashScriptOverrides = {
      flashArgs = lib.mkForce ["-r" "${config.hardware.nvidia-jetpack.flashScriptOverrides.targetBoard}" "sda"];
    };
  };

  nixpkgs.hostPlatform.system = "aarch64-linux";

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };
  ghaf.boot.loader.systemd-boot-dtb.enable = true;

  hardware.deviceTree = {
    enable = true;
    # Redifining the board as Jetson Orin NX with the Jetson-IO-base-B
    # here the Orin NX 16GB is p3767-0000 and Jetson IO base-B is p3509-a02
    name = "tegra234-p3767-0000-p3509-a02.dtb";
  };

  imports = [
    ../../boot/systemd-boot-dtb.nix

    ./partition-template.nix
  ];

}
