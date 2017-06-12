FROM ubuntu:16.04

LABEL software=nmrmlconv
LABEL software.version=1.1b
LABEL version=0.3

LABEL Description="Convert NMR-RAW vendor files to nmrML."

MAINTAINER PhenoMeNal-H2020 Project <phenomenal-h2020-users@googlegroups.com>



# Update, install, clean up
RUN apt-get -y update &&  apt-get -y install --no-install-recommends build-essential software-properties-common byobu \
curl git subversion vim man unzip wget openjdk-8-jre

# Clone nmrML github repo
# RUN git clone https://github.com/nmrML/nmrML
RUN mkdir -p /usr/src/nmrML/tools/Parser_and_Converters/Java/converter/
WORKDIR /usr/src/nmrML/tools/Parser_and_Converters/Java/converter/
RUN svn export https://github.com/nmrML/nmrML/trunk/tools/Parser_and_Converters/Java/converter/bin

# Install nmrML converter
WORKDIR /usr/src/nmrML/tools/Parser_and_Converters/Java/converter
RUN install -m755 bin/nmrMLcreate /usr/local/bin
RUN install -m755 bin/nmrMLproc /usr/local/bin
RUN mkdir /usr/local/share/nmrML
RUN install -m755 bin/converter.jar /usr/local/share/nmrML/

# Cleanup
RUN apt-get -y --purge --auto-remove remove subversion git
RUN apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /var/cache/oracle-jdk7-installer /usr/src/nmr* /tmp/* /var/tmp/*

# Add scripts
ADD runTest1.sh /usr/local/bin/runTest1.sh
ADD nmrmlconv.sh /usr/local/bin/nmrmlconv.sh

# Define data directory
RUN mkdir /data
WORKDIR /data

#ENTRYPOINT [ "/usr/local/bin/nmrmlconv.sh" ]
#ENTRYPOINT [ "java", "-jar", "/usr/local/share/nmrML/converter.jar" ]

