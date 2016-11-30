FROM java:7-alpine

MAINTAINER Julien Kernec'h <docker@dial-once.com>

ENV DRILL_VERSION=1.9.0
ENV DOCKERIZE_VERSION=0.2.0

# Update base packages and install dev packages
# Then get drill, extract it and clean everything
RUN apk update \
  && apk upgrade \
  && apk add --no-cache ca-certificates wget tar bash \
  && mkdir -p /opt/drill \
  && wget -O - https://github.com/jwilder/dockerize/releases/download/v${DOCKERIZE_VERSION}/dockerize-linux-amd64-v${DOCKERIZE_VERSION}.tar.gz | tar -xzf - -C /usr/local/bin \
  && wget -O - https://www.apache.org/dist/drill/drill-${DRILL_VERSION}/apache-drill-${DRILL_VERSION}.tar.gz | tar -xzf - --strip=1 -C /opt/drill \
  && apk del wget tar

COPY ./drill-override.conf.tmpl /opt/drill/conf/drill-override.conf.tmpl

EXPOSE 8047 31010 31011 31012 46655

CMD dockerize \
  -template /opt/drill/conf/drill-override.conf.tmpl:/opt/drill/conf/drill-override.conf \
  /opt/drill/bin/drillbit.sh start && tail -f /opt/drill/log/drillbit.out
