#Build Stage
FROM maven:3.6.3-openjdk-11-slim AS build

RUN mkdir -p /usr/local/app
 
COPY ./src /usr/local/app/src

COPY ./pom.xml /usr/local/app/pom.xml
 
WORKDIR /usr/local/app/
 
RUN mvn -Dmaven.test.skip=true clean package

# Publish Stage
FROM tomcat:8.5-jdk11-openjdk-slim
COPY --from=build /usr/local/app/target/sample.war  /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]