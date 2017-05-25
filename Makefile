# disease_model_talks
### Started in Taiwan 2016. Meant to unify different existing talk frameworks
### But a disaster from a directory POV

# https://github.com/dushoff/disease_model_talks/

# https://github.com/dushoff/disease_model_talks/tree/master/git_push

##################################################################

### Hooks for the editor to set the default target
current: target
target = Makefile
-include target.mk
target: $(target)

##################################################################

# make files

Sources = Makefile .gitignore README.md sub.mk LICENSE.md notes.txt
Drop = ~/Dropbox
include sub.mk
-include local.mk

-include $(ms)/newtalk.def

##################################################################

## Drop stuff

## This should be replaced by a more principled approach, but not right this very second
## Images need to have an automatic makefile added, so they can be made by others; the files need a Drop. Other Drops should probably just be repos (or merged into repos)
## my_images should generate fake images if the real ones aren't there (so people can make when necessary)

web_drop/%: web_drop ;
web_drop:
	$(LNF) $(Drop)/courses/Lecture_images $@

my_images/%: my_images ;
my_images:
	$(LN) $(Drop)/$@ .

tbincome/%: tbincome
tbincome:
	$(LN) $(Drop)/ICI3D/WorkingWiki-export/TB_and_income/$@ .

######################################################################

## Content sources
## I guess I want all the repo things here, but I'm less clear on why
Sources += Disease_data SIR_simulations SIR_model_family

Sources += local.txt.format

# We need to fiddle with beamer.tmp for templates
Sources += beamer.tmp

## Copyright not integrated into make system yet
Sources += copy.tex

Sources += $(wildcard *.txt)

######################################################################

# Family/dynamics
# Probably not worth trying to merge; good ICI3D stuff from Taiwan has largely been incorporated. The Taiwan stuff takes a wider perspective (dandelions and eigenvalues)

### Dynamical models lecture debut NTU 2016
### NTU 2016-1
dynamics.final.pdf: dynamics.txt
dynamics.draft.pdf: dynamics.txt
dynamics.handouts.pdf: dynamics.txt

### ICI3D model family lectures
family.draft.pdf: family.txt
family.handouts.pdf: family.txt

Sources += live_2016.R

##################################################################

### Need to work out Lecture image/web drop stuff before making these

### Dynamical foundations lecture debut NTU 2016
### Nice stuff about simple Jacobians and zooming, the idea of qualitative analysis …
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

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/modules.mk
-include $(ms)/newtalk.mk
-include $(ms)/newlatex.mk
-include $(ms)/wrapR.mk
