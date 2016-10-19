<!-- Guidance:
Logo: The logo needs have the text "Logo" inside the square bracket place holder to be recognized at the App Library.
Tool name: First single hashtag (#) will be taken as tool name.
Version: Should always go after the first hastag and before the second hastag. The line needs to respond to the regexp "^Version: (.+)" being the first group the actual version.

Fields: for the App Library, the following fields will be parsed:

# Name of the tool
Version: z.x-whatever
## Short description
## Description
## Key features
## Publications
## Screenshots
## Tool Authors 
- Author 1 and affiliation
- [Author 2](link_to_author_2) and affiliation
## Container Contributors
- Contributor 1
- [Contributor 2](link_to_contributior_2) and affiliation
## Website
## Usage Instructions

Free text with triple tick code blocks, comprising docker, ipython and galaxy usage

## Installation 

They all have to be at the second hashtag level

For screenshots, you should use the following scheme:

![screenshot](screenshots/s1.gif)
![screenshot](screenshots/s2.gif)

-->



# nmrMLconvert

![Logo](nmrML.png)

## Short description

[nmrML](http://nmrml.org/) is an open mark-up language for NMR data. This project contains files that are needed to use the tools to convert RAW vendor NMR files to nmrML files.

## Description

nmrML is an open mark-up language for NMR data. It is currently under heavy development and is not yet ready for public use. The development of this standard is coordinated by Workpackage 2 of the COSMOS - COordination Of Standards In MetabOlomicS Project. COSMOS is a global effort to enable free and open sharing of metabolomics data. Coordinated by Dr Christoph Steinbeck of the EMBL-European Bioinformatics Institute. COSMOS brings together European data providers to set and promote community standards that will make it easier to disseminate metabolomics data through life science e-infrastructures. This Coordination Action has been financed with €2 million by the European Commission's Seventh Framework Programme. The nmrML data standard will be approved by the Metabolomics standards Initiative and was derived from an earlier nmrML that was developed by the Metabolomics Innovation Centre (TMIC).

## Publications
Rocca-Serra P, Salek RM, Arita M, Correa E, Dayalan S, Gonzalez-Beltran A, Ebbels T, Goodacre R, Hastings J, Haug K, Koulman A, Nikolski M, Oresic M, Sansone SA, Schober D, Smith J, Steinbeck C, Viant MR, Neumann S (2016): Data standards can boost metabolomics research, and if there is a will, there is a way. Metabolomics 12(1): 14. doi:10.1007/s11306-015-0879-3

## Tool Authors 
- nmrML Standards Group <info@nmrml.org>

## Container Contributors
- Kristian Peters <kpeters@ipb-halle.de>, IPB-Halle
- Steffen Neumann <sneumann@ipb-halle.de>, IPB-Halle

## Website
http://nmrml.org
https://github.com/nmrML/nmrML

## Usage Instructions
Building the Docker image

`docker build --tag="phnmnl/nmrmlconv:latest" .`

## Usage instructions

This examples uses one of the RAW files included in MTBLS1, which you get when you clone the [nmrML-github repository](https://github.com/nmrML/nmrML/) to /usr/src.

`docker run -ti -v /usr/src/nmrML/examples/MTBLS1/FIDs/ADG10003u_007/10/:/src
		 -v $PWD:/data phnmnl/nmrmlconv:latest
		 -l create
		 -b -z -t bruker
		 -i /src/
		 -o /data/ADG10003u_007_10.nmrml`

## Galaxy usage

A rudimentary Galaxy node description is included as `nmrmlconv.xml`.

