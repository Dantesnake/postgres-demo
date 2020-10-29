# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
LABEL maintainer="dante_snake@live.com.mx"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 5027

# The application's jar file
ARG JAR_FILE=target/postgres-demo-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} postgres-demo.jar

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/postgres-demo.jar"]
 
# docker build
# sudo docker build -t jonagomez/postgres-demo .

# docker run
# sudo docker run --name romangj-api -p 5027:8080 jonagomez/postgres-demo
