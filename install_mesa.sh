#!/bin/bash

sudo apt update

# sudo apt install -y build-essential meson git python3-mako libexpat1-dev bison flex libwayland-egl-backend-dev libxext-dev libxfixes-dev libxcb-glx0-dev libxcb-shm0-dev libxcb-dri2-0-dev libxcb-dri3-dev libxcb-present-dev libxshmfence-dev libxxf86vm-dev libxrandr-dev libdrm-dev libunwind-dev cmake

# sudo apt-get -y build-dep mesa

sudo apt install -y build-essential meson git python3-mako libexpat1-dev bison flex libwayland-egl-backend-dev libxext-dev libxfixes-dev libxcb-glx0-dev libxcb-shm0-dev libxcb-dri2-0-dev libxcb-dri3-dev libxcb-present-dev libxshmfence-dev libxxf86vm-dev libxrandr-dev libdrm-dev libunwind-dev cmake autoconf automake autopoint autotools-dev bindgen debhelper dh-autoreconf dh-strip-nondeterminism directx-headers-dev dwz ed glslang-tools libclang-15-dev libclang-common-15-dev libclang-cpp15-dev libclc-15 libclc-15-dev libdebhelper-perl libdrm-dev libfile-stripnondeterminism-perl libllvmspirvlib-15-dev libllvmspirvlib15 libpciaccess-dev libsensors-dev libset-scalar-perl libstd-rust-1.63 libstd-rust-dev libsub-override-perl libtool libva-dev libvdpau-dev libwayland-bin libwayland-dev libwayland-egl-backend-dev libxcb-dri2-0-dev libxcb-dri3-dev libxcb-present-dev libxrandr-dev libxshmfence-dev libxxf86vm-dev libzstd-dev llvm-15 llvm-15-dev llvm-15-linker-tools llvm-15-runtime llvm-15-tools llvm-spirv-15 po-debconf python3-mako python3-markupsafe quilt rustc spirv-tools valgrind wayland-protocols xutils-dev libxslt1.1 pkgconf-bin pkgconf pkg-config python3-roman python3-docutils xsltproc systemd-sysv libpam-systemd systemd libsystemd-shared libsystemd0 udev libudev1 docutils-common libpkgconf3 libudev-dev libx11-xcb-dev zlib1g zlib1g-dev

sudo cp mali_csffw.bin /lib/firmware

mkdir build
cd build

CFLAGS="-O3" meson -Dgallium-drivers=panfrost,swrast -Dvulkan-drivers= -Dllvm=disabled  -Dbuildtype=release --prefix=/opt/panfrost

ninja -j8

sudo ninja install

echo /opt/panfrost/lib/aarch64-linux-gnu | sudo tee /etc/ld.so.conf.d/0-panfrost.conf
sudo ldconfig
