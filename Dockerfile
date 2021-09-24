##########
# BUILD  #
##########
FROM mozilla/sbt AS build
ARG APP_NAME=xml-tester
ARG APP_VERSION=1.2.4

WORKDIR /root/app/

COPY . .

RUN sbt -Dsbt.repository.config=./repositories -Dsbt.override.build.repos=true dist

##########
# DEPLOY #
##########

FROM adoptopenjdk/openjdk8:jre8u292-b10 AS deploy
ARG APP_NAME=xml-tester
ARG APP_VERSION=1.2.4
ENV APP_NAME=${APP_NAME}

WORKDIR /root/app/

COPY --from=build /root/app/target/universal/${APP_NAME}-${APP_VERSION}.zip .

RUN apt-get update && apt-get upgrade -y && apt-get install -y unzip

RUN unzip ${APP_NAME}-${APP_VERSION}.zip \
  && mv ${APP_NAME}-${APP_VERSION}/* .\
  && rm -rf ${APP_NAME}-${APP_VERSION}*

EXPOSE 9000

ENTRYPOINT "./bin/${APP_NAME}"

FROM deploy
