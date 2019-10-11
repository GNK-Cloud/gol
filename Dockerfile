FROM ubuntu:latest
ENV CATALINA_HOME /opt/tomcat/apache-tomcat-9.0.26
ENV PATH $CATALINA_HOME/bin:$PATH
RUN apt-get -y update 
RUN apt-get install -y openjdk-8-jdk wget
RUN mkdir /opt/tomcat
RUN wget http://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.26/bin/apache-tomcat-9.0.26.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.26 /opt/tomcat
ADD /var/lib/jenkins/workspace/Docker-App/gameoflife-web/target/gameoflife.war /opt/tomcat/apache-tomcat-9.0.26/webapps/
#COPY entrypoint.sh /
EXPOSE 8080
CMD ["catalina.sh", "run"]
#CMD ["/opt/tomcat/apache-tomcat-9.0.26/bin/startup.sh", "run"]
RUN /entrypoint.sh
