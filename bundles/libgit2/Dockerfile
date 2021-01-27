FROM linuxbrew/brew

# Load our custom tap
RUN \
  brew update && \
  brew tap autobrew/linux

# Build our custom binaries
RUN brew install zlib-static --build-bottle
RUN brew install pcre-static --build-bottle
RUN brew install libssh2-static --build-bottle
RUN brew install libgit2-static --build-bottle

# Enable brace expansion below
SHELL ["/bin/bash", "-c"]

# Create output bundle
RUN mkdir -p /bundle/libgit2 && \
  export BREWDIR=$(brew --prefix) && \
  cp -R $BREWDIR/opt/openssl/{include,lib} /bundle/libgit2 && \
  cp -R $BREWDIR/opt/zlib-static/{include,lib} /bundle/libgit2 && \
  cp -R $BREWDIR/opt/pcre-static/{include,lib} /bundle/libgit2 && \
  cp -R $BREWDIR/opt/libssh2-static/{include,lib} /bundle/libgit2 && \
  cp -R $BREWDIR/opt/libgit2-static/{include,lib} /bundle/libgit2 

RUN cd /bundle && tar -czvf libgit2-1.1.0.x86_64_linux.tar.gz libgit2
