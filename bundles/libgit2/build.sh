#!/bin/sh
target=$PWD
(cd ../../; docker build -f "$target/Dockerfile" . -t libgit2)
docker run -v "$PWD:/host" libgit2 cp -f /bundle/libgit2-1.1.0.x86_64_legacy-linux.tar.gz /host
