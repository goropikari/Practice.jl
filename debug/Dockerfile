FROM ubuntu:18.04 as builder

ARG JULIA_VERSION=1.3.0

WORKDIR /root

RUN apt-get update && \
    apt-get install -y build-essential wget gfortran python git && \
    wget https://github.com/JuliaLang/julia/releases/download/v1.3.0/julia-1.3.0-full.tar.gz && \
    tar xvf julia-1.3.0-full.tar.gz && \
    cd julia-1.3.0 && \
    export JULIA_BUILD_MODE=debug && \
    make

FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install -y gdb gdbserver cgdb vim emacs git && \
    rm /etc/sysctl.d/10-ptrace.conf && \
    sysctl -p

COPY --from=builder /root /root
