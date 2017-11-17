install.packages('httr', repos = 'http://cran.us.r-project.org')
install.packages(c('repr', 'IRdisplay', 'pbdZMQ', 'httr', 'devtools'), repos = 'http://cran.us.r-project.org')
devtools::install_github('IRkernel/IRkernel')

IRkernel::installspec()

#install.packages("devtools",repos = 'http://cran.us.r-project.org')

#library("devtools")

#install.packages(c('pbdZMQ', 'repr', 'devtools'))  # repr is already on CRAN
# devtools::install_github('IRkernel/repr')        # or get the latest repr from master
#devtools::install_github('IRkernel/IRkernel')

q()
