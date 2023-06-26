# Use a base image with Java installed
FROM ubuntu

RUN mkdir /app

RUN apt update && apt install default-jdk -y

RUN apt install nginx -y

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the Maven build to the container
COPY project/target /app

# Expose the port(s) that your application listens on
EXPOSE 80

# Set the entrypoint command to run the JAR file
ENTRYPOINT ["javac", "App"]
