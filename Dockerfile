FROM ubuntu
MAINTAINER ["kundan kumar"]
WORKDIR /home/ubuntu
RUN apt-get update
RUN apt-get install -y default-jdk
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz ./
RUN tar zxvf apache-tomcat-9.0.89.tar.gz
RUN cp -r  apache-tomcat-9.0.89 /opt
ADD ./target/addressbook.war /opt/apache-tomcat-9.0.89/webapps
RUN rm -r /opt/apache-tomcat-9.0.89/conf/tomcat-users.xml
ADD tomcat-users.xml /opt/apache-tomcat-9.0.89/conf
RUN rm -r /opt/apache-tomcat-9.0.89/webapps/manager/META-INF/context.xml
ADD context.xml /opt/apache-tomcat-9.0.89/webapps/manager/META-INF
EXPOSE 8080/tcp
CMD ["/opt/apache-tomcat-9.0.89/bin/catalina.sh", "run"]
                                                              
