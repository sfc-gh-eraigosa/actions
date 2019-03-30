FROM golang:1.11-alpine3.8

LABEL "name"="github-release"
LABEL "maintainer"="Edward Raigosa <wenlock@github.com>"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="github-release for GitHub Actions"
LABEL "com.github.actions.description"="Create a GitHub release with Actions."
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

RUN apk update \
    && apk add bash git openssh curl jq
ENV PATH="/github-release/bin:${PATH}"

COPY bin /github-release/bin
COPY entrypoint.sh /entrypoint.sh

RUN go get github.com/aktau/github-release
