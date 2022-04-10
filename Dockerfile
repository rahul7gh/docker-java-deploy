FROM openjdk

ADD ./launch.sh .
RUN chmod 777 launch.sh
ADD ./DockerDemo-0.0.1-SNAPSHOT.jar .
EXPOSE 8443
ENTRYPOINT ["java","-jar","DockerDemo-0.0.1-SNAPSHOT.jar"]