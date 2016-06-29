# disease_model_talks
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: dynamics.draft.pdf 

##################################################################


# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
include $(ms)/newtalk.def

##################################################################

## Content

## Experimenting

Sources += $(wildcard *.txt)

dynamics.draft.pdf: dynamics.txt

######################################################################

now:
	@echo $@

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
-include $(ms)/newtalk.mk
-include $(ms)/newlatex.mk
