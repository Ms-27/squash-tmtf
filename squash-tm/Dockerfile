FROM openjdk:8-jre-alpine

ARG SQUASH_TM_LATEST_VERSION='1.20.0'
ENV SQUASH_TM_VERSION=$SQUASH_TM_LATEST_VERSION
ENV SQUASH_TM_URL="http://repo.squashtest.org/distribution/squash-tm-${SQUASH_TM_LATEST_VERSION}.RELEASE.tar.gz"

EXPOSE 8080

RUN echo $SQUASH_TM_VERSION

RUN apk add --update --no-cache \
	mysql-client \
	postgresql-client \
	curl

WORKDIR /opt
RUN curl -L ${SQUASH_TM_URL} | gunzip -c | tar x

# Configure Squash TM properties
WORKDIR /opt/squash-tm/conf
RUN sed -i "s!#tm.test.automation.server.callbackurl=http://localhost:8080/squash!tm.test.automation.server.callbackurl=http://localhost:8081/squash!" squash.tm.cfg.properties

WORKDIR /opt/squash-tm/bin
COPY install-script.sh .
COPY api_test.sh .
RUN chmod +x startup.sh install-script.sh api_test.sh

# Modifying data in squash-tm/bin/startup.sh & executing startup.sh
CMD ./install-script.sh ; ./api_test.sh

#RUN ./api_test.sh

# Create a Test Automation Server user

#CMD ./startup.sh