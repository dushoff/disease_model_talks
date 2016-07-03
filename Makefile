# disease_model_talks
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: foundations.draft.pdf 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
include $(ms)/newtalk.def

##################################################################

## Content

Sources += local.txt.format

## Copyright not integrated into make system yet
Sources += copy.tex

Sources += $(wildcard *.txt)

### Dynamical models lecture debut NTU 2016
dynamics.final.pdf: dynamics.txt
dynamics.draft.pdf: dynamics.txt
dynamics.handouts.pdf: dynamics.txt

### Dynamical foundations lecture debut NTU 2016
foundations.final.pdf: foundations.txt
foundations.draft.pdf: foundations.txt
foundations.handouts.pdf: foundations.txt

### Heterogeneity
heterogeneity.draft.pdf: heterogeneity.txt
heterogeneity.handouts.pdf: heterogeneity.txt

Archive += foundations.handouts.pdf dynamics.handouts.pdf
Archive += foundations.final.pdf dynamics.final.pdf

######################################################################

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
-include $(ms)/newtalk.mk
-include $(ms)/newlatex.mk
