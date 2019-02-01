FROM jenkins/jenkins:lts

# Disable running wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Configure admin user
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

# Setup Plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Setup Jobs - it's important to setup proper ownership via --chown=jenkins
# as without that jenkins won't have proper write access
COPY --chown=jenkins Jobs  /var/jenkins_home/jobs/

USER root
COPY run.sh ./run.sh
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-18.09.1.tgz && tar --strip-components=1 -xvzf docker-18.09.1.tgz -C /usr/local/bin && \
    chmod +x ./run.sh && \
    apt-get update -y && apt-get install -y sudo python-pip && \
    pip install awscli && \
    apt-get clean -y

ENTRYPOINT ["/bin/bash","-c","./run.sh"]