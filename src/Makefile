%.pdf : %.typ
	typst compile $^ $@

%.png : %.typ
	typst compile $^ $@

%.svg : %.typ
	typst compile $^ $@

%.html : %.typ
	pandoc -o $@ $^


rwildcard = $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))
HERE := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# all the sources recursively
TYPS := $(call rwildcard, $(HERE),*.typ)
generated = $(foreach e, pdf png svg html, $(TYPS:.typ=.$(e)))

.PHONY: all pdfs pngs svgs htmls clean
all : htmls
pdfs: $(TYPS:.typ=.pdf)
pngs: $(TYPS:.typ=.png)
svgs: $(TYPS:.typ=.svg)
htmls: $(TYPS:.typ=.html)

clean:
	rm --verbose --force $(call generated)
