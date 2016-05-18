FROM ubuntu:trusty

MAINTAINER PhenoMeNal-H2020 Project <phenomenal-h2020-users@googlegroups.com>

LABEL Description="Convert NMR-RAW vendor files to nmrML."



# Update & upgrade sources
RUN apt-get -y update
RUN apt-get -y dist-upgrade

# Install mandatory packages
RUN apt-get -y install build-essential software-properties-common
RUN apt-get install -y byobu curl git htop man unzip vim wget

# Install Java
RUN apt-get -y install openjdk-7-jdk openjdk-7-jre

# Clean up
RUN apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /var/cache/oracle-jdk7-installer /tmp/* /var/tmp/*

# Clone nmrML github repo
WORKDIR /usr/src
RUN git clone https://github.com/nmrML/nmrML

# Install nmrML converter
WORKDIR /usr/src/nmrML/tools/Parser_and_Converters/Java/converter
RUN install -m755 bin/nmrMLcreate /usr/local/bin
RUN install -m755 bin/nmrMLproc /usr/local/bin
ADD nmrMLconv.sh /usr/local/bin/nmrMLconv
RUN mkdir /usr/local/share/nmrML
RUN install -m755 bin/converter.jar /usr/local/share/nmrML/

# Define data directory
RUN mkdir /data
WORKDIR /data

ENTRYPOINT ["sh","/usr/local/bin/nmrMLconv"]

