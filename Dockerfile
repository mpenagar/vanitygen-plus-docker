# Multistage docker build, requires docker 17.05

# builder stage
FROM nvidia/opencl:devel-ubuntu16.04 as builder

RUN set -ex && \
    apt-get update && \
    apt-get --no-install-recommends --yes install \
        build-essential \
        git libssl-dev \
        libpcre3-dev \
        apt-transport-https \
        ca-certificates \
        libcurl4-openssl-dev && \
    git clone https://github.com/exploitagency/vanitygen-plus && \
    cd vanitygen-plus && \
    make all


# runtime stage
FROM nvidia/opencl:runtime-ubuntu16.04

RUN set -ex && \
    apt-get update && \
    apt-get --no-install-recommends --yes install libssl1.0.0 && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /vanitygen-plus /vanitygen-plus

WORKDIR /vanitygen-plus
ENTRYPOINT ["./oclvanitygen"]
