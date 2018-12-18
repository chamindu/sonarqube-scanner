FROM openjdk:8u181-jre-stretch

LABEL maintainer="Chamindu Munasinghe <cmunasinghe@gmail.com>"

WORKDIR /root

RUN curl https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip --output ./sonar-scanner.zip \
    && unzip sonar-scanner.zip \
    && rm sonar-scanner.zip \
    && mv sonar-scanner-3.2.0.1227-linux


ENV SONAR_RUNNER_HOME=/root/sonar-scanner
ENV PATH $PATH:/root/sonar-scanner/bin

CMD sonar-scanner -Dsonar.projectBaseDir=./src
