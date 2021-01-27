#!/bin/sh
docker build . -t libgit2
docker run -v "$PWD:/host" libgit2 cp -f /bundle/libgit2-1.1.0.x86_64_linux.tar.gz /host
