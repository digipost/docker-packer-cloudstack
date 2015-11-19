# Dockerfile for packer-cloudstack

This Dockerfile builds https://github.com/schubergphilis/packer-cloudstack

## Run

    docker run -it -v $(pwd):/packer digipost/packer-cloudstack build template.json

## Build locally (optional)

    git clone https://github.com/digipost/docker-packer-cloudstack.git
    cd docker-packer-cloudstack
    docker build -t digipost/packer-cloudstack .
