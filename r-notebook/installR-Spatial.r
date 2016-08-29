install.packages('ctv',
                 repos = 'http://cran.us.r-project.org')
library('ctv')
install.views('Spatial', repos='http://cran.us.r-project.org')

missingpackages <- c('adegraphics', 'adespatial', 'ape', 'cclust', 'FD', 'labdsv')
for (i in missingpackages) {
install.packages(i, repos='http://cran.us.r-project.org')
}

devtools::install_github("wesm/feather/R")
devtools::install_github("bwlewis/rthreejs")
install.packages("rglwidget", repos = 'http://cran.us.r-project.org')

install.packages('rgrass7',
                 repos = 'http://cran.us.r-project.org')

install.packages("rpostgis", repos = 'http://cran.us.r-project.org')

q()
