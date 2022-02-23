FROM rocker/verse:3.5

RUN R -e "install.packages('devtools')"

RUN R -e "devtools::install_version('lsmeans', version = '2.30-0', dependencies = T)"
RUN R -e "devtools::install_version('lme4', version = '1.1-12', dependencies = T)"

ADD script.Rmd /home/rstudio/
ADD original_markdown.html /home/rstudio/
