# Preliminaries
rm(list = ls())
library(tidyverse)
library(utils)
library(plot3D)

# Create vectors x, y and pdf
M <- mesh(seq(0, 1, length=100), seq(0, 1, length=100))
x <- M$x
y <- M$y
z <- 6/5 * (x + y^2)

# Plot pdf
persp3D(x, y, z, xlab='X variable', ylab='Y variable', xlim=c(0,1), main='Plotting joint pdf')

# Create vectors of cdf of X and Y
marginal_cdfs <- tibble(x=seq(0, 1, length=100), cdfX=6/5*(x^2/2+x/3), cdfY=6/5*(x^3/3+x/2))

# Plot cdf                  
ggplot(marginal_cdfs, aes(x=x), xlab='X, Y Variables', ylab='pdfX, pdfY', title='CDFs of X and Y') +
  geom_line(aes(y=cdfX, color='cdfX')) +
  geom_line(aes(y=cdfY, color='cdfY'))

            
