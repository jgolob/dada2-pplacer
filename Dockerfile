# dada2-pplacer
#
# VERSION               0.2.0

FROM      alpine:3.7
# For singularity on the hutch cluster
RUN mkdir /fh && mkdir /app && mkdir /src
RUN mkdir -p /mnt/inputs/file && mkdir -p /mnt/outputs/file && mkdir /scratch && mkdir /working
RUN apk add --no-cache bash \
python3==3.6.3-r9 \
python3-dev==3.6.3-r9 \
gfortran \
build-base
RUN ln -s /usr/bin/python3 /usr/local/bin/python
RUN pip3 install pip --upgrade
RUN pip3 install \
numpy==1.13.3 \
pandas==0.20.3 \
awscli>=1.15.14 \
boto3>=1.7.14 \
bucket_command_wrapper==0.3.0 
RUN apk del gfortran build-base
COPY dada2_pplacer/dada2_taxonomy_to_tallies_wide.py /usr/local/bin/dada2-taxonomy-to-tallies-wide
RUN chmod +x /usr/local/bin/dada2-taxonomy-to-tallies-wide
COPY dada2_pplacer/dada2_seqtab_to_pplacer.py /usr/local/bin/dada2-seqtab-to-pplacer
RUN chmod +x /usr/local/bin/dada2-seqtab-to-pplacer
