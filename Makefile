all: list

list:
	@basename configs/*defconfig

%_defconfig:
	@if [ -f configs/$@ ]; then cp configs/$@ .config; fi

edit:
	vi .config

install:
	./dotutil .config

clean:
	rm .config
