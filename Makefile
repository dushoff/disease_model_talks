# disease_model_talks
### Started in Taiwan 2016. Meant to unify different existing talk frameworks
### Seems to be working; used for DAIDD and now updating with submodules for MMED

# https://github.com/dushoff/disease_model_talks/

# https://github.com/dushoff/disease_model_talks/tree/master/git_push

##################################################################

### Hooks for the editor to set the default target
current: target
target = Makefile
-include target.mk
target: $(target)

##################################################################

## Content sources
## WARNING: Slashes can kill!!
dirs += makestuff SIR_simulations Exponential_figures SIR_model_family Disease_data LatexTemplates Birth_death_models Endemic_curves

dfiles: $(dirs:%=%/Makefile)
Sources += $(dirs)

mdirs += $(dirs)

######################################################################

# make files

Sources += Makefile .gitignore README.md sub.mk LICENSE.md notes.txt
Drop = ~/Dropbox
include sub.mk
-include local.mk

-include $(ms)/newtalk.def

##################################################################

# Theme for whatever lectures are now being prepared
# .tmp files not here will be made from talkdir
Sources += beamer.tmp notes.tmp

######################################################################

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

######################################################################


Sources += local.txt.format

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
family.final.pdf: family.txt

######################################################################

Sources += $(wildcard *.R)

live.Rout: live.R

##################################################################

### Need to work out Lecture image/web drop stuff before making these

### Dynamical foundations lecture debut NTU 2016
### Nice stuff about simple Jacobians and zooming, the idea of qualitative analysis …
foundations.final.pdf: foundations.txt
foundations.draft.pdf: foundations.txt
foundations.handouts.pdf: foundations.txt

### Heterogeneity
# https://github.com/dushoff/disease_model_talks/tree/master/git_push/heterogeneity.draft.pdf 

### NTU 2016-3
heterogeneity.final.pdf: heterogeneity.txt
heterogeneity.draft.pdf: heterogeneity.txt
heterogeneity.handouts.pdf: heterogeneity.txt

### Fitting (Williams/Hargrove/Pulliam)
### NTU 2016-4
confront.draft.pdf: confront.txt
confront.handouts.pdf: confront.txt

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/modules.mk
-include $(ms)/newtalk.mk
-include $(ms)/newlatex.mk
-include $(ms)/wrapR.mk
