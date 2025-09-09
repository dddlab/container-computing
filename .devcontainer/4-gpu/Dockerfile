FROM quay.io/jupyter/pytorch-notebook:cuda12-python-3.12.8

USER root

### System packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        lmodern file curl g++ tmux && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/library-scripts

USER ${NB_USER}

### GitHub CLI Installation
ENV GH_CLI_VER "2.30.0"
ENV GH_CLI_URL "https://github.com/cli/cli/releases/download"
RUN wget -O - \
        ${GH_CLI_URL}/v${GH_CLI_VER}/gh_${GH_CLI_VER}_linux_amd64.tar.gz | \
    tar xvzf - -C /opt/conda/bin gh_${GH_CLI_VER}_linux_amd64/bin/gh \
        --strip-components=2

### Prints Jupyter server token when terminal is opened
RUN echo "echo \"Jupyter server token: \$(jupyter server list 2>&1 | grep -oP '(?<=token=)[[:alnum:]]*')\"" > ${HOME}/.get-jupyter-url.sh && \
    echo "sh \${HOME}/.get-jupyter-url.sh" >> ${HOME}/.bashrc
