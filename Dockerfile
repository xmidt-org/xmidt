# This docker file was used to produce the docker image used to build the
# RPMs for the servers.

FROM centos:6

MAINTAINER weston_schmidt@alumni.purdue.edu

RUN yum install -y rpm-build rpmdevtools && rpmdev-setuptree
RUN rpm --import https://mirror.go-repo.io/centos/RPM-GPG-KEY-GO-REPO
RUN curl -s https://mirror.go-repo.io/centos/go-repo.repo | tee /etc/yum.repos.d/go-repo.repo
RUN yum install -y golang
RUN yum clean all
RUN mkdir -p /gopath/bin
ENV GOPATH /gopath
ENV GOBIN /gopath/bin
ENV PATH $PATH:$GOBIN
RUN curl https://glide.sh/get | sh
RUN yum install -y git
