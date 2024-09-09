FROM ubuntu
MAINTAINER ["kundan kumar"]
WORKDIR /home/ubuntu
RUN apt-get update
RUN apt-get install -y default-jdk
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.93/bin/apache-tomcat-9.0.93.tar.gz ./
RUN tar zxvf apache-tomcat-9.0.93.tar.gz
RUN cp -r  apache-tomcat-9.0.93 /opt
ADD ./target/addressbook.war /opt/apache-tomcat-9.0.93/webapps
RUN rm -r /opt/apache-tomcat-9.0.93/conf/tomcat-users.xml
ADD tomcat-users.xml /opt/apache-tomcat-9.0.93/conf
RUN rm -r /opt/apache-tomcat-9.0.93/webapps/manager/META-INF/context.xml
ADD context.xml /opt/apache-tomcat-9.0.93/webapps/manager/META-INF
EXPOSE 8080/tcp
CMD ["/opt/apache-tomcat-9.0.89/bin/catalina.sh", "run"]
                                                              
