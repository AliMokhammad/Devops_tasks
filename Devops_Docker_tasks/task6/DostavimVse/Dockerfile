FROM maven:3.8.4-jdk-8

WORKDIR /usr/src/app
COPY . /usr/src/app

COPY wait-for-it.sh wait-for-it.sh

RUN mvn package -P init-base
RUN mvn package -P web-app

EXPOSE 8080

RUN chmod +x wait-for-it.sh

#ENTRYPOINT ["java", "-jar","target/dostavimvse-0.0.1-SNAPSHOT.jar"]