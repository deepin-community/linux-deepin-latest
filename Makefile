abiname=5.15.77
all: build
build:
	cat debian/control.in | sed -e 's/ABINAME/$(abiname)/g' > debian/control
