

missingpackages <- c('sp','rgdal','adegraphics', 'adespatial', 'ape', 'cclust', 'FD', 'labdsv', 'devtools')
for (i in missingpackages) {
install.packages(i, repos='http://cran.us.r-project.org')
}

devtools::install_github("wesm/feather/R")
devtools::install_github("bwlewis/rthreejs")
install.packages("rglwidget", repos = 'http://cran.us.r-project.org')

install.packages('rgrass7',
                 repos = 'http://cran.us.r-project.org')

install.packages("rpostgis", repos = 'http://cran.us.r-project.org')

#install.packages("rgl", repos = 'http://cran.us.r-project.org')

q()
