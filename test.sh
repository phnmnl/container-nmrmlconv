#!/bin/bash

docker run -i -v `pwd`/examples:/data --rm nmrmlconv \
      -l create -b -z -t bruker -i /data/MMBBI_10M12-CE01-1a/1 -o /data/MMBBI_10M12-CE01-1a.nmrML

docker run -i -v `pwd`/examples:/data --rm nmrmlconv \
      -l proc -i /data/MMBBI_10M12-CE01-1a.nmrML -d /data/MMBBI_10M12-CE01-1a/1/pdata/1 -o /data/MMBBI_10M12-CE01-1a.nmrML


