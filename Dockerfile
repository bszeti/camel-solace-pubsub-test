# On Mac: podman build --platform linux/x86_64  . -t camel-solace-pubsub-test:latest
#         podman tag localhost/camel-solace-pubsub-test quay.io/bszeti/camel-solace-pubsub-test
#         podman push quay.io/bszeti/camel-solace-pubsub-test
FROM registry.redhat.io/fuse7/fuse-java-openshift-jdk11-rhel8:1.13

LABEL src https://github.com/bszeti/camel-solace-pubsub-test

# Source
COPY ./ /tmp/src/
USER root
RUN chmod -R "g=u" /tmp/src

# Maven build
RUN /usr/local/s2i/assemble
RUN rm -rf /tmp/src/target

USER jboss




