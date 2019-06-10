# Makefile para construir los Trabajos Practicos de Administracion y Gestion de Redes
# Mauro A. Meloni <maurom@unlu.edu.ar>

REQUIRED_PACKAGES := pandoc lmodern texlive-xetex texlive-generic-recommended texlive-fonts-recommended fonts-dejavu

$(foreach package,$(REQUIRED_PACKAGES),\
	$(if $(shell dpkg -s $(package) 2> /dev/null),,$(error "Please execute 'apt-get install $(REQUIRED_PACKAGES)' and try again")))

.PHONY: all clean

all: pdf/gl-introduccion.pdf pdf/tp-transmision-datos.pdf pdf/tpl1-configuracion.pdf \
	pdf/tpl2-telnet.pdf pdf/tpl3-dns.pdf pdf/tpl4-correo-electronico.pdf pdf/tpl5-http.pdf \
	pdf/tpe-sockets.pdf pdf/receta-tp-integrador-2019.pdf pdf/tpl1-parte2.pdf tplX-ruteo-2019.pdf

pdf/%.pdf: %.md header.tex
	@- mkdir pdf
	cp "$<" /tmp/output.md
	sed -i '/Notas para ayudantes/,/Fin notas para ayudantes/d' /tmp/output.md
	pandoc -f markdown -t latex --latex-engine=xelatex --include-in-header header.tex \
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
