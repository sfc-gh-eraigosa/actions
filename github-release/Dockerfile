FROM golang:1.11-alpine3.8 as build

LABEL "name"="github-release"
LABEL "maintainer"="Edward Raigosa <wenlock@github.com>"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="github-release for GitHub Actions"
LABEL "com.github.actions.description"="Create a GitHub release with Actions."
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash git openssh curl jq
ENV PATH="/github-release/bin:${PATH}"

RUN go get github.com/aktau/github-release

COPY bin /github-release/bin
COPY entrypoint.sh /entrypoint.sh

FROM golang:1.11-alpine3.8 as test

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash git openssh curl jq ncurses
ENV PATH="/github-release/bin:${PATH}"
ENV TERM=vt100

RUN mkdir /install-bats \
    && git clone https://github.com/bats-core/bats-core.git \
    && cd bats-core \
    && ./install.sh /usr/local \
    && bats --version

COPY --from=build /go /go
COPY --from=build /github-release /github-release
COPY test /github-test
WORKDIR /github-test
