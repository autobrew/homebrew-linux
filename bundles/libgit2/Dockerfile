FROM homebrew/brew

RUN brew update && \
  brew install openssl@1.1 && brew unlink openssl@1.1 && \
  rm -R /home/linuxbrew/.linuxbrew/opt/openssl@1.1/include && \
  rm -R /home/linuxbrew/.linuxbrew/opt/openssl@1.1/lib && \
  mkdir -p /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/autobrew/homebrew-core/

COPY Formula /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/autobrew/homebrew-core/Formula

RUN brew install autobrew/core/openssl

# Build our custom binaries
RUN brew install libssh2-static --build-bottle
RUN brew install zlib-static --build-bottle
RUN brew install pcre-static --build-bottle
RUN brew install libgit2-static --build-bottle

# Just to test if it worked
RUN brew bottle zlib-static pcre-static libssh2-static libgit2-static

# Enable brace expansion belowß
SHELL ["/bin/bash", "-c"]

# Create output bundle
RUN mkdir -p /bundle/libgit2/lib && \
  export BREWDIR=$(brew --prefix) && \
  cp -R $BREWDIR/opt/libgit2-static/include /bundle/libgit2/ && \
  cp -R $BREWDIR/opt/{openssl,libgit2-static,zlib-static,pcre-static,libssh2-static}/lib/*.a /bundle/libgit2/lib/

RUN cd /bundle && \
  tar -czvf libgit2-1.1.0.x86_64_legacy-linux.tar.gz libgit2
