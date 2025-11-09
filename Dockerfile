# On Mac: docker build --platform linux/x86_64  . -t camel-solace-pubsub-test:latest
FROM registry.redhat.io/fuse7/fuse-java-openshift-rhel8:1.11

LABEL src https://github.com/bszeti/camel-solace-pubsub-test

# Source
COPY ./ /tmp/src/
USER root
RUN chmod -R "g=u" /tmp/src

# Maven build
USER 185
RUN /usr/local/s2i/assemble
RUN rm -rf /tmp/src/target


