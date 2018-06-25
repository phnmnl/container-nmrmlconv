FROM ubuntu:16.04

LABEL software=nmrmlconv
LABEL software.version=1.1b
LABEL version=0.6
LABEL Description="Convert NMR-RAW vendor files to nmrML."

ENV REVISION="7461af4925e4f3bf33eb24b96684a42f68bb2709"

MAINTAINER PhenoMeNal-H2020 Project <phenomenal-h2020-users@googlegroups.com>



# Update, install, clean up
RUN apt-get -y update &&  apt-get -y install --no-install-recommends build-essential software-properties-common byobu curl git subversion vim man unzip zip wget perl-base openjdk-8-jre

# Install relevant nmrML binary files from their repo
RUN mkdir -p mkdir /usr/local/share/nmrML && \
    curl -o /usr/local/share/nmrML/converter.jar https://raw.githubusercontent.com/nmrML/nmrML/$REVISION/tools/Parser_and_Converters/Java/converter/bin/converter.jar && \
    curl -o /usr/local/bin/nmrMLcreate https://raw.githubusercontent.com/nmrML/nmrML/$REVISION/tools/Parser_and_Converters/Java/converter/bin/nmrMLcreate && \
    curl -o /usr/local/bin/nmrMLproc https://raw.githubusercontent.com/nmrML/nmrML/$REVISION/tools/Parser_and_Converters/Java/converter/bin/nmrMLproc && \
    chmod 755 /usr/local/share/nmrML/converter.jar && \
    chmod 755 /usr/local/bin/nmrML*

# Cleanup
RUN apt-get -y --purge --auto-remove remove subversion git && \
    apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /var/cache/oracle-jdk7-installer /usr/src/nmr* /tmp/* /var/tmp/*

# Add scripts
ADD runTest1.sh /usr/local/bin/runTest1.sh
ADD nmrmlconv.sh /usr/local/bin/nmrmlconv.sh

# Define data directory
RUN mkdir /data
WORKDIR /data

#ENTRYPOINT [ "/usr/local/bin/nmrmlconv.sh" ]
#ENTRYPOINT [ "java", "-jar", "/usr/local/share/nmrML/converter.jar" ]

