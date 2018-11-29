FROM python:3.6-alpine

ENV GRADLE_VERSION  2.13

RUN apk add --update --no-cache git build-base linux-headers python-dev openjdk8 wget \
  && mkdir -p /opt \
  && cd /tmp \
  && apk add --no-cache wget \
  && wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
  && cd /opt \
  && unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip \
  && rm /tmp/gradle-${GRADLE_VERSION}-bin.zip \
  && ln -s gradle-${GRADLE_VERSION} gradle \
  && apk del wget \
  && apk update \
  && rm -rf /var/cache/apk/*
RUN pip install esrally==0.4.8
COPY rally.ini /root/.rally/
