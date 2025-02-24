# Makefile para construir los Trabajos Practicos de Administracion y Gestion de Redes
# Mauro A. Meloni <maurom@unlu.edu.ar>

REQUIRED_PACKAGES := pandoc lmodern texlive-xetex texlive-latex-recommended texlive-fonts-recommended fonts-dejavu

# define los argumentos de pandoc segun la version, pues hay diferencia entre v1 y v2
PANDOC_VERSION_MAJOR := $(shell pandoc --version | head -1 | cut -d' ' -f2 | cut -d'.' -f1)
ifeq "$(PANDOC_VERSION_MAJOR)" "3"
    PANDOC_FLAGS := --pdf-engine=xelatex
else ifeq "$(PANDOC_VERSION_MAJOR)" "2"
    PANDOC_FLAGS := --pdf-engine=xelatex
else
    PANDOC_FLAGS := --latex-engine=xelatex
endif

$(foreach package,$(REQUIRED_PACKAGES),\
	$(if $(shell dpkg -s $(package) 2> /dev/null),,$(error "Please execute 'apt-get install $(REQUIRED_PACKAGES)' and try again")))

.PHONY: all clean

all: \
	pdf/apunte-ipv6.pdf                   \
	pdf/cheatsheet.pdf                    \
	pdf/gl-introduccion.pdf               \
	pdf/guiadeestilo_TPs.pdf              \
	pdf/missing-semester-command-line.pdf \
	pdf/missing-semester-course-shell.pdf \
	pdf/practica_autoguiada_sockets.pdf   \
	pdf/receta-tp-integrador-2019.pdf     \
	pdf/tp-eficiencia-enlace.pdf          \
	pdf/tp-final.pdf                      \
	pdf/tp-ruteo-estatico-2020.pdf        \
	pdf/tp-ruteo-estatico-2021.pdf        \
	pdf/tp-transmision-datos.pdf          \
	pdf/tpe-sockets.pdf                   \
	pdf/tpl00-AKA_Los_Labos_de_Pierre.pdf \
	pdf/tpl1-configuracion-inicial.pdf    \
	pdf/tpl1-parte2.pdf                   \
	pdf/tpl2-telnet.pdf                   \
	pdf/tpl3-dns.pdf                      \
	pdf/tpl4-correo-electronico.pdf       \
	pdf/tpl5-http.pdf                     \
	pdf/tpl6-http-parte2.pdf              \
	pdf/tpl7-ipv6-2022.pdf                \
	pdf/tplX-ipv6-a-distancia.pdf

pdf/%.pdf: markdown/%.md header.tex
	mkdir -p pdf
	cp "$<" /tmp/output.md
	sed -i '/Notas para ayudantes/,/Fin notas para ayudantes/d' /tmp/output.md
	pandoc -f markdown -t latex $(PANDOC_FLAGS) --include-in-header header.tex \
		-V lang=es-AR -V geometry:a4paper -V fontsize=11pt -V documentclass=article \
		-V geometry:headheight=1in -V geometry:margin=1in -V geometry:top=1.5in \
		-V mainfont="DejaVu Serif" -V colorlinks=true -V graphics=true \
		-V monofont="Latin Modern Mono" \
		-V author-meta=$(shell whoami) \
		-V mainfontoptions="Scale=MatchLowercase" \
		/tmp/output.md -o "$@"
	sha256sum "$@" > "$@.sha256"
	#evince "$@" &

%.html: markdown/%.md
	pandoc -f markdown -t html5 -s "$<" -o "$@"

clean:
	- rm -v pdf/*.pdf
	- rm -v pdf/*.sha256
	- rmdir pdf
