FROM openjdk:8

MAINTAINER Rob Lazzurs <rob@lazzurs.org>

ENV JMETER_VERSION 2.8
ENV JMETER_HOME /usr/local/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN $JMETER_HOME/bin

RUN cd /tmp && \
    wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
    tar -xzf apache-jmeter-${JMETER_VERSION}.tgz -C /usr/local && \
    rm apache-jmeter-${JMETER_VERSION}.tgz

ENV PATH $PATH:$JMETER_BIN

WORKDIR $JMETER_HOME

CMD ["jmeter"]
