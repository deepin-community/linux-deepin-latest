amd64_abiname=5.15.77
arm64_abiname=5.10.0
loong64_abiname=6.9.0
ARCH_BUILD :=$(shell uname -m)
all: build
build:
ifeq ($(ARCH_BUILD), x86_64)
	cat debian/control.in | sed -e 's/AMD64ABINAME/$(amd64_abiname)/g' > debian/control
else ifeq ($(ARCH_BUILD), aarch64)
	cat debian/control.in | sed -e 's/ARM64ABINAME/$(arm64_abiname)/g' > debian/control
else ifeq ($(ARCH_BUILD), loongarch64)
	cat debian/control.in | sed -e 's/LOONG64ABINAME/$(loong64_abiname)/g' > debian/control
endif
