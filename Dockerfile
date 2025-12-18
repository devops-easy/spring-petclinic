FROM openjdk:17-ea-17-jdk

# Required for starting application up.
RUN apk update && apk add /bin/sh

RUN mkdir -p /opt/app
ENV PROJECT_HOME /opt/app

COPY target/*.jar $PROJECT_HOME/spring-petclinic-pro.jar

WORKDIR $PROJECT_HOME

EXPOSE 8080

CMD ["java", "-Dspring.data.mongodb.uri=mongodb://mongo:27017/spring-mongo","-Djava.security.egd=file:/dev/./urandom","-jar","./spring-petclinic-pro.jar"]
