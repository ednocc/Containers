FROM rocker/rstudio:4.1.2

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y \
 git \
 git-lfs \
 make \
 gzip \
 rename \
 software-properties-common \
 && mkdir -p /home/rstudio/work

RUN  add-apt-repository -y ppa:ubuntu-toolchain-r/test \
  && apt-get update -y  --allow-unauthenticated \
  && apt-get install -y libxml2-dev libpoppler-cpp-dev libapparmor-dev \
     gfortran gcc-7 g++-7 libx11-dev libglu1-mesa-dev libfreetype6-dev \ 
     libxml2-dev libgmp-dev glpk-utils libproj-dev libgdal-dev \
  && apt-get install -y r-cran-igraph r-cran-rglpk

RUN  Rscript -e 'install.packages(c("mvtnorm", "matrixcalc", "igraph", "gplots", "Matrix", "devtools", "micropan", "shiny", "circlize", "RColorBrewer", "data.table", "RLumShiny", "BiocManager", "proj4", "coda")); devtools::install_github("xavierdidelot/BactDating"); BiocManager::install(); BiocManager::install(c("GenomicRanges", "ggtree"))' \
  && git clone https://github.com/YaoLab-Bioinfo/shinyCircos /home/rstudio/shinyCircos/

EXPOSE 8788/tcp
