Java based nmrML converter
=======

See https://github.com/nmrML/nmrML/tree/master/tools/Parser_and_Converters/Java/converter for more information about this tool.

## Base Docker Image

#### Installation

Requirements:
   * a recent Linux OS that support Docker (see https://www.docker.com/)

1. Install [Docker](https://www.docker.com/).
2. Build the Docker image
```
$ docker build -t nmrmlconv .
```

### Usage

```
$ docker run -i --rm nmrmlconv -l create
$ docker run -i --rm nmrmlconv -l proc
```

### Example

```
docker run -i -v `pwd`/examples:/data --rm nmrmlconv \
      -l create -b -z -t bruker -i /data/MMBBI_10M12-CE01-1a/1 -o /data/MMBBI_10M12-CE01-1a.nmrML

docker run -i -v `pwd`/examples:/data --rm nmrmlconv \
      -l proc -i /data/MMBBI_10M12-CE01-1a.nmrML -d /data/MMBBI_10M12-CE01-1a/1/pdata/1 -o /data/MMBBI_10M12-CE01-1a.nmrML
```

