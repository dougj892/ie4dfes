# Bayesian methods for decision-focused evaluations

This repository contains supplementary code for the IDinsight working paper "From What Works to Specific Decisions". 

## Installing R and RStan on your local computer
Prior to running this code, you first need to install R and RStan. We also highly recommend installing RStudio, an R code editor with support for Stan.  You should install R, then RStudio, then RStan in that order. Links to install each of these on your computer are included below:
1. Install [R](https://cran.rstudio.com/)
2. Install [RStudio](https://rstudio.com/products/rstudio/download/)
3. Install [RStan](https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started) 


## That's a huge pain, can't I just run it on the cloud?
Installing RStan can take some time and can be a bit finicky. If you have trouble installing RStan or just don't feel like going through the hassle, there are a few other options for running R and RStan in the cloud.

1. Run R and RStan on a Kaggle notebook (easiest)
Kaggle users can run R and RStan using Kaggle notebook. To run R and RStan using a Kaggle notebook, sign up for Kaggle, sign in, then copy and edit this [Kaggle notebook]9(https://www.kaggle.com/thimac/rstan?scriptVersionId=20867095).
2. Run R and RStan on Google Collab (less easy)
It is also possible to run R and RStan on a google collab notebook though it takes a bit of hacking and is quite slow. We don't know much about this option but for those who would like to test it out you can find an example of a collab notebook running RStan [here](https://github.com/jgabry/bayes-workflow-book/blob/master/jupyter/R/Golf_Putting.ipynb).  
3. Run R and RStan on AWS (hard)
This is probably a good option for those of you already familiar with AWS.  Louis Aslett maintains a set of public AMIs for nearly all AWS regions.  You can find more details about the AMIs and how to use them [here](http://www.louisaslett.com/RStudio_AMI/). One advantage of this approach is that you can allocate more computing power than you would probably have access to on a local computer.  