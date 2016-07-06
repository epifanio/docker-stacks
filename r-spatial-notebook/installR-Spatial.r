install.packages('ctv',
                 repos = 'http://cran.us.r-project.org')
library('ctv')
install.views('Spatial', repos='http://cran.us.r-project.org')

missingpackages <- c('adegraphics', 'adespatial', 'ape', 'cclust', 'FD', 'labdsv', 'rgl')
for (i in missingpackages) {
install.packages(i, repos='http://cran.us.r-project.org')
}
q()
