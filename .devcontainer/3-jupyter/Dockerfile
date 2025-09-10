FROM quay.io/jupyter/datascience-notebook:r-4.3.3

USER root

### RStudio system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        lmodern psmisc lsb-release libssl-dev libclang-dev libpq5 libtiff-dev && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/library-scripts
    
### install RStudio server
### Stable version only available for amd64 architecture
ARG RSTUDIO_VER="2025.05.1-513"
ARG RSTUDIO_URL="https://download2.rstudio.org/server/jammy/amd64"
RUN wget -q "${RSTUDIO_URL}/rstudio-server-${RSTUDIO_VER}-amd64.deb" && \
    apt-get install -yq --no-install-recommends ./rstudio*.deb && \
    rm -f ./rstudio*.deb && \
    apt-get clean && \
    chmod 777 /var/run/rstudio-server && \
    chmod +t /var/run/rstudio-server
    
USER ${NB_USER}

### RStudio launch button in JupyterLab
RUN mamba install -y -c conda-forge --freeze-installed \
        jupyter-rsession-proxy=2.2.0 && \
    mamba clean --all

### Enhanced R terminal
RUN pip install radian==0.6.11

### Additional editing and debugging tools for VS Code R development
RUN echo 'options(repos=c(CRAN="https://cloud.r-project.org"))' > ~/.Rprofile && \
    R -q -e 'remotes::install_version("markdown", version="1.12")' && \
    R -q -e 'remotes::install_version("languageserver", version="0.3.16")' && \
    R -q -e 'remotes::install_version("httpgd", version="2.0.1")' && \
    R -q -e 'remotes::install_github("ManuelHentschel/vscDebugger", ref="v0.5.2")'
