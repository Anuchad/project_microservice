# Use the official Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Set environment variables to non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install dependencies
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    wget \
    gnupg2 \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# Add the Jenkins repository and its GPG key
#RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - \
#    && sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update the package list again and install Jenkins
#RUN apt-get update && apt-get install -y \
#    jenkins \
#    && rm -rf /var/lib/apt/lists/*

# Install Node.js (using the NodeSource Node.js 14.x repository)
#RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
#    && apt-get install -y nodejs \
#    && rm -rf /var/lib/apt/lists/*

# Expose the Jenkins port
#EXPOSE 8080

# Start Jenkins
#CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
