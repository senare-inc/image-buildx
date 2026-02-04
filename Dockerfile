FROM cgr.dev/chainguard/wolfi-base

USER root

RUN apk update && apk add --no-cache \
    docker \
    docker-cli-buildx \
    docker-credential-ecr-login \
    aws-cli \
    bash \
    git \
    ca-certificates

# ensure docker plugins dir exists (sometimes needed for buildx detection)
RUN mkdir -p /usr/lib/docker/cli-plugins

# sanity check
RUN docker --version \
 && docker buildx version \
 && git --version \
 && bash --version \
 && ssh -V \
 && docker-credential-ecr-login -v || true


# default shell
CMD ["/bin/bash"]
