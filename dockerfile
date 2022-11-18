FROM tomcat:8.0-alpine
LABEL maintainer="deepak@softwareyoga.com"

ADD helloworld-0.0.1.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
