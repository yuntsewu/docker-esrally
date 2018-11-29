FROM python:3.6-alpine

ENV GRADLE_VERSION  2.13

RUN apk add --update --no-cache git build-base linux-headers python-dev openjdk8 gradle curl \
    # Install gradle
    && curl -SLO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
    && mkdir -p "${GRADLE_HOME}" \
    && unzip "gradle-${GRADLE_VERSION}-bin.zip" -d "/opt" \
    && rm -f "gradle-${GRADLE_VERSION}-bin.zip" \
    && apk del curl
RUN pip install esrally==0.4.8
COPY rally.ini /root/.rally/
