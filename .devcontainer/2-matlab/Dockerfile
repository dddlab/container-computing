FROM docker.io/mathworks/matlab:r2024b

RUN sudo apt-get update && sudo apt-get install git -y

RUN pipx upgrade matlab-proxy && \
    pipx inject --include-apps --include-deps \
      matlab-proxy jupyter-matlab-proxy jupyterlab