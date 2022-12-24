# alpine-terraform
My minimal dockerfile for terraform  
It aims at creating a minimally sized image.
It defaults to terraform v1.0.2 (the one I am currently using) but can be easily customized to any aversion via build-arg in the command line:
```
docker build --file ./Dockerfile --build-arg TF_VERSION=1.4.0-alpha20221109 -t alpine-terraform .
```
That's basically it.  
[VR]
