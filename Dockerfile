FROM rocker/tidyverse:4.2
LABEL maintainer="elliot@rstudio.com"

ENV RENV_VERSION 0.16.0
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

WORKDIR /project
COPY . .

RUN R -e "renv::restore()"

RUN R CMD INSTALL --build .

ENTRYPOINT [/project/exec/checkPhraseAction.R]
