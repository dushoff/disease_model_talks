
# disease_model_talks
### Started in Taiwan 2016. Meant to unify different existing talk frameworks

##################################################################

### Hooks for the editor to set the default target
current: target
target = Makefile
-include target.mk
target: $(target)

######################################################################

## makestuff

Sources += Makefile .ignore 
Ignore += .gitignore

msrepo = https://github.com/dushoff
ms = makestuff
Ignore += local.mk
-include local.mk
-include $(ms)/os.mk

# -include $(ms)/perl.def

Sources += $(ms)
Makefile: $(ms) $(ms)/Makefile
$(ms):
	git submodule add -b master $(msrepo)/$(ms)

## Only meant to work with makestuff.sub
$(ms)/%.mk: $(ms) $(ms)/Makefile ;
$(ms)/Makefile:
	git submodule update -i

##################################################################

## Content sources
## WARNING: Slashes can kill!!
dirs += SIR_simulations Exponential_figures SIR_model_family Disease_data Birth_death_models Endemic_curves Generation_distributions
resting += LatexTemplates 

Sources += $(dirs)

mdirs += $(dirs)

######################################################################

# make files

Sources += Makefile .ignore README.md LICENSE.md notes.txt
## Drop = ~/Dropbox ## Why was this good?
imageDrop = ~/Dropbox/disease_model_lectures/

-include $(ms)/newtalk.def
-include $(ms)/perl.def
-include $(ms)/repos.def

##################################################################

# Theme for whatever lectures are now being prepared
# .tmp files not here will be made from talkdir
Sources += beamer.tmp notes.tmp

######################################################################

## Drop stuff

## Dropping web_drop and changing to webpix
## Old step files in ~/gitroot/Lecture_images, I guess
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

tmpfigs:
	$(MKDIR)

%.png: %.svg
	$(convert)

tmpfigs/%: ~/Dropbox/HIV_presentations/images/%
	$(copy)

## Cribbing on airplane, see dynamics.txt

### ICI3D model family lectures
family.draft.pdf: family.txt
family.handouts.pdf: family.txt
family.final.pdf: family.txt
family.push: 

### Ebola-themed talk for Hiroshi
### Not done

lessons.draft.pdf: lessons.txt
lessons.handouts.pdf: lessons.txt
lessons.final.pdf: lessons.txt
lessons.push: 

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
