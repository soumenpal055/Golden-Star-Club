# Tomcat server base image
FROM tomcat:9.0-jdk11-openjdk

# Tomar project files Tomcat ROOT-e copy korchi
COPY . /usr/local/tomcat/webapps/ROOT/

# Port 8080 open korchi
EXPOSE 8080

CMD ["catalina.sh", "run"]