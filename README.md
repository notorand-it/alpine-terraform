# alpine-based docker files
My minimal dockerfiles for terraform and tfenv  
They aim at creating minimally sized images in two different *flavors* : terraform and tfenv.

## `Dockerfile.terraform`
This file will create an image containing a specific terraform version.  
It defaults at v1.0.2 (the one I am currently using) and can be easily customized to any version via build-arg in the command line.  
```
docker build --file ./Dockerfile.terraform --build-arg TF_VERSION=1.3.6 -t alpine_terraform
```
The resulting image is about 76 MB in size.  

## `Dockerfile.tfenv`
This file will create an image, with an optional inital version for terraform:
```
docker build --file ./Dockerfile.tfenv --build-arg TF_VERSION=1.3.6 -t alpine_tfenv
```
The version variable `TF_VERSION` can be left unspecified. In this case it is **important** that each target directory contains a `.terraform-version` file so `tfenv` can automatically download and use it.  
See [the documentation](https://github.com/tfutils/tfenv#terraform-version-file) for all details.
```
docker build --file ./Dockerfile.tfenv -t alpine_tfenv
# Dynamically selected terraform version
```
The resulting image is about 14 MB in size + the size of the optional terraform binary (about 60 MB extra).  

Unluckily, Alpine linux images doesn't ship with `bash` and uses `wget` instead of  `curl`.  
Those two packages are required by `tfenv` to work properly and need to be installed explicitly by the docker file.
---
[VR]
