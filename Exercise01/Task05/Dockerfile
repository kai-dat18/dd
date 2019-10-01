FROM rocker/r-ver:3.5.2
COPY ./copy_files.R /opt/Rscripts/docker/
COPY ./task05.txt /src
CMD ["/usr/local/bin/Rscript", "/opt/Rscripts/docker/copy_files.R"]