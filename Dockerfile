FROM openjdk:8

MAINTAINER Rob Lazzurs <rob@lazzurs.org>

RUN useradd --create-home -s /bin/bash jmeter
WORKDIR /home/jmeter
USER jmeter

ENV JMETER_VERSION 5.0
ENV JMETER_HOME /home/jmeter/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN $JMETER_HOME/bin

RUN cd /tmp && \
    wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
    tar -xzf apache-jmeter-${JMETER_VERSION}.tgz -C /home/jmeter && \
    rm apache-jmeter-${JMETER_VERSION}.tgz

ENV PATH $PATH:$JMETER_BIN

WORKDIR $JMETER_HOME

# suggestion: don't run GUI per default as no X11 disp env variable is set
# so this breaks in docker-compose environments
# CMD ["jmeter"]
