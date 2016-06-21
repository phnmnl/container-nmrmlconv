# nmrML convert Docker Buildfile

[nmrML](http://nmrml.org/) is an open mark-up language for NMR data. This project contains files that are needed to use the tools to convert RAW vendor NMR files to nmrML files in Docker.

## Building the Docker image

`docker build --tag="phnmnl/nmrmlconv:latest" .`

## Using the Docker image

This examples uses one of the RAW files included in MTBLS1, which you get when you clone the [nmrML-github repository](https://github.com/nmrML/nmrML/) to /usr/src.

`docker run -ti -v /usr/src/nmrML/examples/MTBLS1/FIDs/ADG10003u_007/10/:/src
		 -v $PWD:/data phnmnl/nmrmlconv:latest
		 -l create
		 -b -z -t bruker
		 -i /src/
		 -o /data/ADG10003u_007_10.nmrml`

## Galaxy usage

A rudimentary Galaxy node description is included as `nmrmlconv.xml`.

