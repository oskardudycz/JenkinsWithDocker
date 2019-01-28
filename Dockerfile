FROM jenkins/jenkins:lts-alpine

# Disable running wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Configure admin user
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

# Setup Plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Setup Jobs
COPY Jobs /var/jenkins_home/jobs/