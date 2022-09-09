# Maven Podman --mount cache example

Building java/scala project container is **really slow** if you don't cache
the container layers because the build process goes to maven central (or your self 
hosted) repo every time. You can stop that happening, and take advantage of the
build cache and `~/.m2` dir.

This example shows how to use build layer caching with podman v4 and above

> **Note**
> [On Ubuntu 2204 how to install podman v4 from source](https://blog.karmacomputing.co.uk/install-podman-from-source-ubuntu/) may be needed


# Speed comparison 

First build: > 7 secconds
```
time podman build -t test .
[INFO] Scanning for projects...
[INFO] 
[INFO] ----------------------< com.mycompany.app:my-app >----------------------
[INFO] Building my-app 1
[INFO] --------------------------------[ jar ]---------------------------------


...

real	0m7.328s
user	0m15.264s
sys	0m1.642s
```

Seccond build is a *lot* faster thanks to caching (no need to go to maven central every time):


Seccond build:

```
time podman build -t test .

...

real	0m0.865s
user	0m0.692s
sys	0m0.367s

```
