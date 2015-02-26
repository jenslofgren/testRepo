FROM dockerfile/java:oracle-java7

MAINTAINER Jens Löfgren <jens.lofgren@netgraph.se>

ENV APPVERSION 1.4.1-2
ENV APPJAR guest-login-webapp-1.4.1-2.jar

RUN apt-get update && apt-get install -y wget

#RUN groupadd -r wifiuser && useradd -r -g wifiuser wifiuser
RUN mkdir /home/wifiuser
#RUN chown -R wifiuser:wifiuser /home/wifiuser

#USER wifiuser
ENV HOME /home/wifiuser

WORKDIR /home/wifiuser
VOLUME /home/wifiuser/neo4j

RUN wget http://46.59.33.52:8081/artifactory/netgraph-release-local/se/netgraph/portal/guest-login-webapp/$APPVERSION/$APPJAR

EXPOSE 8090
CMD java -jar guest-login-webapp-1.4.1-2.jar
