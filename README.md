# alpine-based docker files
My minimal dockerfiles for terraform and tfenv  
They aim at creating minimally sized images.  
They default to terraform v1.0.2 (the one I am currently using) but can be easily customized to any aversion via build-arg in the command line.  
tfenv-based image can dynamically download/switch verdion on a per directory basis via `.terraform.version` file with.  
Give it a try with:
```
docker build --file ./Dockerfile-<flavor> --build-arg TF_VERSION=1.3.6 -t alpine-<flavor> .
```
That's basically it.  
[VR]
