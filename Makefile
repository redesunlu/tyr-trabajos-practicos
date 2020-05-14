# Makefile para construir los Trabajos Practicos de Administracion y Gestion de Redes
# Mauro A. Meloni <maurom@unlu.edu.ar>

REQUIRED_PACKAGES := pandoc lmodern texlive-xetex texlive-generic-recommended texlive-fonts-recommended fonts-dejavu

# define los argumentos de pandoc segun la version, pues hay diferencia entre v1 y v2
PANDOC_VERSION_MAJOR := $(shell pandoc --version | head -1 | cut -d' ' -f2 | cut -d'.' -f1)
ifeq "$(PANDOC_VERSION_MAJOR)" "2"
    PANDOC_FLAGS := --pdf-engine=xelatex
else
    PANDOC_FLAGS := --latex-engine=xelatex
endif

$(foreach package,$(REQUIRED_PACKAGES),\
	$(if $(shell dpkg -s $(package) 2> /dev/null),,$(error "Please execute 'apt-get install $(REQUIRED_PACKAGES)' and try again")))

.PHONY: all clean

all: pdf/gl-introduccion.pdf pdf/tp-transmision-datos.pdf pdf/tpl1-configuracion-inicial.pdf \
	pdf/tpl2-telnet.pdf pdf/tpl3-dns.pdf pdf/tpl4-correo-electronico.pdf pdf/tpl5-http.pdf \
	pdf/tpe-sockets.pdf pdf/receta-tp-integrador-2019.pdf pdf/tpl1-parte2.pdf \
	pdf/tp-ruteo-estatico-2020.pdf pdf/tp-eficiencia-enlace.pdf pdf/tpl1-configuracion-inicial.pdf \
	pdf/cheatsheet.pdf pdf/missing-semester-course-shell.pdf pdf/missing-semester-command-line.pdf

pdf/%.pdf: %.md header.tex
	mkdir -p pdf
	cp "$<" /tmp/output.md
	sed -i '/Notas para ayudantes/,/Fin notas para ayudantes/d' /tmp/output.md
	pandoc -f markdown -t latex $(PANDOC_FLAGS) --include-in-header header.tex \
		-V lang=es-AR -V geometry:a4paper -V fontsize=11pt -V documentclass=article \
		-V geometry:headheight=1in -V geometry:margin=1in -V geometry:top=1.5in \
		-V mainfont="DejaVu Serif" -V colorlinks=true -V graphics=true \
		-V monofont="Latin Modern Mono" -V monofontoptions="Colour=990000" \
		-V author-meta=$(shell whoami) \
		/tmp/output.md -o "$@"
	#evince "$@" &

clean:
	- rm -v pdf/*.pdf
	- rmdir pdf
