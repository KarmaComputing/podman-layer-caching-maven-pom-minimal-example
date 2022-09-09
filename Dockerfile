FROM maven:alpine as build
ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
RUN --mount=type=cache,target=/root/.m2 mvn -f $HOME/pom.xml clean package

FROM openjdk:8-jdk-alpine
COPY --from=build /usr/app/target/my-app-1.jar /app/runner.jar
ENTRYPOINT java -jar /app/runner.jar
