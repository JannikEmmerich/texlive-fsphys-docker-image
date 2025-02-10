FROM debian:latest

# Set environment variables to ensure non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install texlive-full
RUN apt-get update \
    && apt-get -y install texlive-base texlive-fonts-recommended texlive-fonts-extra texlive-font-utils texlive-lang-german texlive-lang-english texlive-latex-base texlive-latex-recommended texlive-pstricks texlive-science texlive-latex-extra latexmk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Default command
CMD ["bash"]
