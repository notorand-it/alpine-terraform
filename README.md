# alpine-based docker files
My minimal dockerfiles for terraform and tfenv  
They aim at creating minimally sized images in tow different *flavors** : terraform and tfenv.

## `Dockerfile.terraform`
This file will cretae an image containing a fixed terraform client version.  
They default is v1.0.2 (the one I am currently using) and can be easily customized to any version via build-arg in the command line.  
Any other version defined within a `.terraform-version` file found during operations will be automatically downloaded and used.  
```
docker build --file ./Dockerfile.terraform --build-arg TF_VERSION=1.3.6 -t alpine_terraform
```
The resulting image is about 76 MB in size.  

## `Dockerfile.tfenv`
This file will create an image with a specific inital version:
```
docker build --file ./Dockerfile.tfenv --build-arg TF_VERSION=1.3.6 -t alpine_tfenv
# With an initial default terraform version
```
As an option the version can be left unspecified.  
In this case each target directory **must** have a `.terraform-version` file. Thus, **be careful**!  
See [the documentation](https://github.com/tfutils/tfenv#terraform-version-file) for all details.
```
docker build --file ./Dockerfile.tfenv -t alpine_tfenv
# Dynamically selected terraform version
```
The resulting image is about 14 MB in size.  

Unluckily, Alpine linux images doesn't ship with `bash` and uses `wget` instead of  `curl`.  
These two packages are required by `tfenv` to work properly and need to be installed explicitly by the docker file.
---
[VR]
