# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ARG DISTRO_VERSION=18.04
FROM ubuntu:${DISTRO_VERSION}
ARG NCPU=4

RUN apt-get update && \
    apt-get --no-install-recommends install -y \
        automake \
        build-essential \
        ccache \
        clang \
        clang-9 \
        cmake \
        ctags \
        curl \
        gawk \
        git \
        gcc \
        g++ \
        cmake \
        libcurl4-openssl-dev \
        libssl-dev \
        libtool \
        llvm-9 \
        lsb-release \
        make \
        ninja-build \
        pkg-config \
        python3 \
        python3-dev \
        python3-pip \
        tar \
        unzip \
        zip \
        wget \
        zlib1g-dev \
        apt-utils \
        ca-certificates \
        apt-transport-https

# Install Python packages used in the integration tests.
RUN update-alternatives --install /usr/bin/python python $(which python3) 10
RUN pip3 install setuptools wheel
RUN pip3 install git+git://github.com/googleapis/python-storage@8cf6c62a96ba3fff7e5028d931231e28e5029f1c
RUN pip3 install flask==1.1.2 httpbin==0.7.0 scalpl==0.4.0 \
    crc32c==2.1 gunicorn==20.0.4

# Install the Cloud SDK and some of the emulators. We use the emulators to run
# integration tests for the client libraries.
COPY . /var/tmp/ci
WORKDIR /var/tmp/downloads
RUN /var/tmp/ci/install-cloud-sdk.sh
ENV PATH=/usr/local/google-cloud-sdk/bin/:${PATH}
# The Cloud Pub/Sub emulator needs Java :shrug:
RUN apt update && (apt install -y openjdk-11-jre || apt install -y openjdk-9-jre)

# Install Bazel because some of the builds need it.
RUN /var/tmp/ci/install-bazel.sh
