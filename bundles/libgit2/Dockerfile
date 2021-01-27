FROM homebrew/brew

# Load our custom tap
RUN \
  brew update && \
  brew tap autobrew/linux

# Build our custom binaries
RUN brew install zlib-static --build-bottle
RUN brew install pcre-static --build-bottle
RUN brew install libssh2-static --build-bottle
RUN brew install libgit2-static --build-bottle

# Just to test if it worked
RUN brew bottle zlib-static pcre-static libssh2-static libgit2-static

# Enable brace expansion below
SHELL ["/bin/bash", "-c"]

# Create output bundle
RUN mkdir -p /bundle/libgit2/lib && \
  export BREWDIR=$(brew --prefix) && \
  cp -R $BREWDIR/opt/libgit2-static/include /bundle/libgit2/ && \
  cp -R $BREWDIR/opt/{openssl,libgit2-static,zlib-static,pcre-static,libssh2-static}/lib/*.a /bundle/libgit2/lib/

RUN cd /bundle && \
  tar -czvf libgit2-1.1.0.x86_64_linux.tar.gz libgit2
