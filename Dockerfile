FROM debian:latest

# Set environment variables to ensure non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install texlive-full
RUN apt-get update \
    && sudo apt install `sudo apt --assume-no install texlive-full | \
		awk '/The following additional packages will be installed/{f=1;next} /Suggested packages/{f=0} f' | \
		tr ' ' '\n' | \
        grep -vP 'doc$' | \
        tr '\n' ' '` \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Default command
CMD ["bash"]
