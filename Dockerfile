# golob/dada2-pplacer:0.6.1__bcw_0.3.1
#
# VERSION               0.6.1

FROM      alpine:3.8
RUN apk add --no-cache bash \
python3-dev \
build-base
RUN ln -s /usr/bin/python3 /usr/local/bin/python
RUN pip3 install pip --upgrade
RUN pip3 install \
numpy>=1.13.3 \
pandas>=0.20.3 \
awscli>=1.15.14 \
boto3>=1.7.14 \
bucket_command_wrapper==0.3.1
ADD dada2_pplacer/dada2_taxonomy_to_tallies_wide.py /usr/local/bin/dada2-taxonomy-to-tallies-wide
RUN chmod +x /usr/local/bin/dada2-taxonomy-to-tallies-wide
ADD dada2_pplacer/dada2_seqtab_to_pplacer.py /usr/local/bin/dada2-seqtab-to-pplacer
RUN chmod +x /usr/local/bin/dada2-seqtab-to-pplacer
RUN ln -s /usr/local/bin/dada2-seqtab-to-pplacer /usr/local/bin/dada2-seqtab-to-sharefile
