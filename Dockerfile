FROM golang
MAINTAINER larstobi@relatime.no

RUN go get github.com/mitchellh/gox
RUN go get github.com/mitchellh/packer

# packer-cloudstack only builds with Packer 0.7.5
WORKDIR /go/src/github.com/mitchellh/packer
RUN git checkout -b v0.7.5 v0.7.5 && go clean

# Packer 0.7.5 does not build from source anymore, so get the binaries.
RUN curl -s -L -o /tmp/packer_0.7.5_linux_amd64.zip https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip
WORKDIR /go/bin
RUN apt-get update && apt-get install -y unzip && apt-get clean
RUN unzip -o /tmp/packer_0.7.5_linux_amd64.zip

# Build and install packer-cloudstack
RUN go get github.com/schubergphilis/packer-cloudstack
RUN make -C $GOPATH/src/github.com/schubergphilis/packer-cloudstack dev

VOLUME /packer
CMD ["/go/bin/packer"]
