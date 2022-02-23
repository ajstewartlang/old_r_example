FROM rocker/verse:3.5

# Add files to container

#ADD cache/ /home/rstudio/cache/
#ADD data/ /home/rstudio/data/
#ADD figures/ /home/rstudio/figures/
#ADD position_magnitude.Rmd /home/rstudio/
#ADD position_magnitude.Rproj /home/rstudio/

# Add required R packages to container

RUN R -e "install.packages('devtools')"

RUN R -e "devtools::install_version('lsmeans', version = '2.30-0', dependencies = T)"
RUN R -e "devtools::install_version('lme4', version = '1.1-12', dependencies = T)"

ADD script.Rmd /home/rstudio/
ADD original_markdown.html /home/rstudio/
