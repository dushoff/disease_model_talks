
## Should just replace this with a container-thing when you get the chance.

# disease_model_talks
### Started in Taiwan 2016. Meant to unify different existing talk frameworks

##################################################################

### Hooks for the editor to set the default target
current: target
target = Makefile
-include target.mk
target: $(target)

##################################################################

## Content sources
## WARNING: Slashes can kill!!
## Also, no makestuff in mdirs!
dirs += SIR_simulations Exponential_figures SIR_model_family Disease_data LatexTemplates Birth_death_models Endemic_curves Generation_distributions

dfiles: 
	git submodule update -i

Sources += $(dirs)

mdirs += $(dirs)

######################################################################

# make files

Sources += Makefile .ignore README.md sub.mk LICENSE.md notes.txt
Drop = ~/Dropbox
include sub.mk
-include local.mk

-include $(ms)/newtalk.def
-include $(ms)/perl.def
-include $(ms)/repos.def

##################################################################

# Theme for whatever lectures are now being prepared
# .tmp files not here will be made from talkdir
Sources += beamer.tmp notes.tmp

######################################################################

## Drop stuff

## This should be replaced by a more principled approach, but not right this very second
## Images need to have an automatic makefile added, so they can be made by others; the files need a Drop. Other Drops should probably just be repos (or merged into repos)
## my_images should generate fake images if the real ones aren't there (so people can make when necessary)

## Lecture_images submodule nuked and won't come back. Investigate.
## Or else move to newer paradigm (.step here)

Ignore += web_drop
web_drop/%: web_drop ;
web_drop:
	$(LNF) $(Drop)/courses/Lecture_images $@

## Transitioning (scary?)
Sources += $(wildcard *.step)

######################################################################

## Sandbox

Endemic_curves/propCurves.Rout.pdf: Endemic_curves/propCurves.R

######################################################################

Sources += local.txt.format

## Copyright not integrated into make system yet
Sources += copy.tex

Sources += $(wildcard *.txt)

%.push: %.slides.pdf.gp %.handouts.pdf.gp ;

%.slides.pdf: %.draft.pdf
	$(copy)

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
family.push: 

######################################################################

Sources += $(wildcard *.R)

live.Rout: live.R

##################################################################

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
heterogeneity.push:

### Fitting (Williams/Hargrove/Pulliam)
### NTU 2016-4
confront.draft.pdf: confront.txt
confront.handouts.pdf: confront.txt

### Pitch slide
### Intro DAIDD 2017

Sources += pitch.tex
pitch.pdf: pitch.tex

######################################################################

## Stochastic stuff
## Rescuing from MMXD lectures project on wiki

Sources += ds2007.lect stochastic.lect

stochastic.final.pdf: stochastic.txt
stochastic.draft.pdf: stochastic.txt
stochastic.handouts.pdf: stochastic.txt
stochastic.html: stochastic.step
stochastic.push:

######################################################################

## Rabies. Moved here for 2018 public talk
## It's been all over (including its own Workshops module??)
## Using .step for this talk, but I think not most of the others here yet

rabies.final.pdf: rabies.txt
rabies.draft.pdf: rabies.txt
rabies.html: rabies.step

Ignore += TREE_crop.jpg
TREE_crop.jpg: webpix/TREE.jpg
	convert -crop 300x240+40+100 $< $@

######################################################################

## Taxonomy template

Sources += taxonomy.jpg
Ignore += taxon.jpg
taxon.jpg: taxonomy.jpg Makefile
	convert -crop 960x560+0+100 $< $@

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/modules.mk
-include $(ms)/newtalk.mk
-include $(ms)/texdeps.mk
-include $(ms)/wrapR.mk
-include $(ms)/webpix.mk
