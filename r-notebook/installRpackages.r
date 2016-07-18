#install.packages(c('repr', 'IRkernel', 'IRdisplay'),
#                 repos = c('http://irkernel.github.io/', 'http://cran.us.r-project.org'))
#IRkernel::installspec()
library("devtools")

install.packages(c('pbdZMQ', 'repr', 'devtools'))  # repr is already on CRAN
# devtools::install_github('IRkernel/repr')        # or get the latest repr from master
devtools::install_github('IRkernel/IRkernel')

q()
