FROM maven:3.8.4-jdk-8

WORKDIR /usr/src/app
COPY . /usr/src/app

RUN mvn package

ENTRYPOINT ["java", "-jar","target/dostavimvse-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080