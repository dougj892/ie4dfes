# Bayesian methods for decision-focused evaluations

This repository contains supplementary code for the IDinsight working paper "From What Works to Specific Decisions". 

## Installing R and RStan on your local computer
Prior to running this code, you first need to install R and RStan. We also highly recommend installing RStudio, an R code editor with support for Stan.  You should install R, then RStudio, then RStan in that order. Links to install each of these on your computer are included below:
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