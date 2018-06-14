FROM eclipse/stack-base:ubuntu

RUN sudo wget "https://github.com/jgm/pandoc/releases/download/2.2.1/pandoc-2.2.1-1-amd64.deb" && \
    sudo dpkg -i pandoc-2.2.1-1-amd64.deb && \
    sudo rm -rf pandoc-2.2.1-1-amd64.deb

RUN sudo apt-get update && \
    sudo apt-get install -y build-essential && \
    sudo apt-get install -y texlive
