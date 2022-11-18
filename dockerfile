FROM maven:3.6.3-openjdk-11 AS maven_build
#VOLUME /tmp
WORKDIR /tmp
COPY pom.xml /tmp/
COPY src /tmp/src/
#RUN mvn package
RUN mvn -f /tmp/pom.xml clean package
#maintainer
MAINTAINER Rajesh Manne
#FROM tomcat:latest
FROM tomcat:8.5-jdk11-corretto
RUN rm -rf /usr/local/tomcat/conf/server.xml
#copy access-infinity to docker image from builder image
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/
COPY --from=maven_build /tmp/target/access-infinity-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
