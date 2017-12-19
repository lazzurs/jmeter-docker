FROM openjdk:8

MAINTAINER Rob Lazzurs <rob@lazzurs.org>

RUN useradd --create-home -s /bin/bash jmeter
WORKDIR /home/jmeter
USER jmeter

ENV JMETER_VERSION 2.7
ENV JMETER_HOME /home/jmeter/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN $JMETER_HOME/bin

RUN cd /tmp && \
    wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
    tar -xzf apache-jmeter-${JMETER_VERSION}.tgz -C /home/jmeter && \
    rm apache-jmeter-${JMETER_VERSION}.tgz

ENV PATH $PATH:$JMETER_BIN

WORKDIR $JMETER_HOME

CMD ["jmeter"]
