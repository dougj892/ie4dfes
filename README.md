# Bayesian methods for decision-focused evaluations

This repository contains supplementary code for the IDinsight working paper "From What Works to Specific Decisions". In addition to providing example code, we also seek to provide a gentle introduction to Stan and RStan in the notebook "Introduction to Stan and RStan".  If you are relatively new to Stan and Bayesian analysis, we recommend this notebook as a place to start.  It assumes basic knowledge of Bayesian analysis and R, but keeps things as simple as possible. It also assumes that you have access to a version of R with RStan installed. We provide links to additional resources for learning Stan and RStan below.

## Downloading and viewing the notebooks
If you are familiar with git, you can directly clone this repository using Git.

Alternatively, you may download these files by clicking on "clone or download" above. 

If you would prefer to read through the notebooks on the website, you may view the individual notebooks by clicking on the links below:

1. [Intro to Stan and RStan](https://rpubs.com/dougj892/ie4dfes1)
2. ...


## Installing R and RStan on your local computer
Prior to running the code for these examples, you first need to install R and RStan. We also highly recommend installing RStudio, an R code editor with support for Stan.  You should install R, then RStudio, then RStan in that order. Links to install each of these on your computer are included below:
1. Install [R](https://cran.rstudio.com/)
2. Install [RStudio](https://rstudio.com/products/rstudio/download/)
3. Install [RStan](https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started) 


## That's a huge pain, can't I just run it on the cloud?
Installing RStan can take some time and can be a bit finicky. If you have trouble installing RStan or just don't feel like going through the hassle, there are a few other options for running R and RStan in the cloud.

1. **Run R and RStan on a Kaggle notebook (easy)**
Kaggle users can run R and RStan using the Kaggle notebook service (which appears to be identical to Jupyter notebook). To run R and RStan using a Kaggle notebook, sign up for Kaggle, sign in, then copy and edit this [Kaggle notebook](https://www.kaggle.com/thimac/rstan?scriptVersionId=20867095).
2. **Run R and RStan on Google Collab (easy)**
Google Collab allows users to run Jupyter notebooks (or something very similar) in the cloud for free. From what I can tell, collab notebooks are extremely slow but you don't need to sign up for any new services (assuming you have a google login).  Since collab is designed primarily for python users it takes a slight hack to use stan on collab.  There are a few options for doing this: 
   1. Instead of using R and RStan use Python and PyStan (which is already installed).
   2. Create an R notebook by clicking [here](https://colab.research.google.com/notebook#create=true&language=r). Once you have an R notebook, you can either install rstan directly with the command "install.packages('rstan')" or else use the following code (written by Mitzi Morris) to install rstan and a few more packages more quickly:
```
# Install pre-compiled R packages for StanHeaders, bayesplot, and rstan 
if (!file.exists("RStanLibs.tgz")) {
  system("wget https://storage.googleapis.com/rlibs-rstan-plus/RStanLibs.tgz", intern=T)
  system("tar zxf RStanLibs.tgz", intern=T)
  system("mv RStanLibs/* /usr/lib/R/site-library")
}
```
   3. Copy a simple example notebook I have created by going to this [page](https://github.com/dougj892/Jupyter-notebooks/blob/master/RStan_example.ipynb), clicking "open in collab", and then clicking "copy to drive" from the ribbon above the notebook. 
3. **Run R and RStan on AWS (hard)**
This is probably a good option for those of you already familiar with AWS.  Louis Aslett maintains a set of public AMIs for nearly all AWS regions.  You can find more details about the AMIs and how to use them [here](http://www.louisaslett.com/RStudio_AMI/). One advantage of this approach is that you can allocate more computing power than you would probably have access to on a local computer.  

## Additional Resources for Learning Stan 
The [Stan website](https://mc-stan.org/) includes links to numerous resources for learning R and RStan. The documentation provided on this page is very comprehensive but it can also be a bit overwhelming for new users. In particular, we found the Stan User's Guide, while an excellent reference text, very challenging to digest when starting out. In addition, many of the tutorials and case studies assume a relatively high level of understanding of Bayesian statistics.

In our view, a much better place to start for Stan newbies is James Savage's notes for his course on how to use Stan which can be found [here](https://khakieconomics.github.io/half_day_course/index.html).

## Additional Resources for Learning Stan 
We highly recommend the [vignettes ](https://mc-stan.org/rstan/articles/) for learning the RStan interface.