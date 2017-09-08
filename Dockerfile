FROM ruby:2.4.1

RUN apt-get update && \
    apt-get install -qq -y --no-install-recommends build-essential cmake && \
    rm -rf /var/lib/apt/lists/*

ENV INSTALL_PATH /app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

ENV BUNDLE_JOBS=2 \
    BUNDLE_PATH=/bundle

COPY . .
