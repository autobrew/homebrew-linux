# Static bundles

We use linuxbrew to create static bundles: a static library including all of it's dependencies, which can easily be linked into an R package or other application.

For some libraries we can use the binaries from upsteam linuxbrew. But some others we need to rebuild to enable PIC for the static libraries.

## How to run

To build the libgit2 bundle:

```
cd bundles/libgit2
./build.sh
```

See the source for what is happening.
