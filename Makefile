# disease_model_talks
### Started in Taiwan 2016. Meant to unify different existing talk frameworks
### But a disaster from a directory POV

# https://github.com/dushoff/disease_model_talks/

# https://github.com/dushoff/disease_model_talks/tree/master/git_push


##################################################################

### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: heterogeneity.draft.pdf 


##################################################################
# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md notes.txt
include stuff.mk
-include $(ms)/newtalk.def

##################################################################

## Content

Sources += local.txt.format

## Copyright not integrated into make system yet
Sources += copy.tex

Sources += $(wildcard *.txt)

### Dynamical models lecture debut NTU 2016
### NTU 2016-1
### Related to the SIR model family lectures
dynamics.final.pdf: dynamics.txt
dynamics.draft.pdf: dynamics.txt
dynamics.handouts.pdf: dynamics.txt

### Not clear whether to merge dynamics with family
family.draft.pdf: family.txt

##################################################################

archive += dynamics.handouts.pdf dynamics.draft.pdf

### Dynamical foundations lecture debut NTU 2016
### NTU 2016-2
foundations.final.pdf: foundations.txt
foundations.draft.pdf: foundations.txt
foundations.handouts.pdf: foundations.txt
archive += foundations.handouts.pdf foundations.draft.pdf

### Heterogeneity
# https://github.com/dushoff/disease_model_talks/tree/master/git_push/heterogeneity.draft.pdf 

### NTU 2016-3
### So far the same as ICI3D heterogeneity
heterogeneity.final.pdf: heterogeneity.txt
heterogeneity.draft.pdf: heterogeneity.txt
heterogeneity.handouts.pdf: heterogeneity.txt
archive += heterogeneity.handouts.pdf heterogeneity.draft.pdf

### Fitting (Williams/Hargrove/Pulliam)
### NTU 2016-4
confront.draft.pdf: confront.txt
confront.handouts.pdf: confront.txt
archive += confront.handouts.pdf confront.draft.pdf

gp: $(archive:%=%.gp)

### Tracking

######################################################################

Sources += survival.R
survival.Rout: survival.R

### Makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/newtalk.mk
-include $(ms)/newlatex.mk
-include $(ms)/wrapR.mk
