FROM docker.io/library/tomcat:9.0
COPY abc_tech.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]