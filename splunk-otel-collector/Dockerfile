# Set Docker repository and target platform
ARG DOCKER_REPO=docker.io
ARG TARGETARCH
FROM ${DOCKER_REPO}/alpine:3.17.0 as certs
RUN apk --update add ca-certificates

FROM ${DOCKER_REPO}/alpine:3.17.0 AS otelcol
ARG TARGETARCH
COPY dist/otelcol_linux_${TARGETARCH} /otelcol
COPY dist/migratecheckpoint_linux_${TARGETARCH} /migratecheckpoint
# Ensure execute permissions
RUN chmod 755 /otelcol
RUN chmod 755 /migratecheckpoint
RUN echo "splunk-otel-collector:x:999:999::/:" > /etc_passwd
# Create directories with necessary permissions
RUN mkdir -p /otel/collector /splunk-otel-collector /tmp/tmp
RUN chmod 755 /tmp/tmp

FROM ${DOCKER_REPO}/alpine:3.17.0 AS agent-bundle
ARG TARGETARCH
COPY --from=otelcol /etc_passwd /etc_passwd
RUN cat /etc_passwd >> /etc/passwd
COPY --from=otelcol --chown=999 /splunk-otel-collector /usr/lib/splunk-otel-collector
COPY --chown=999 dist/agent-bundle_linux_${TARGETARCH}.tar.gz /dist/
USER splunk-otel-collector
RUN if [[ "$TARGETARCH" = "amd64" || "$TARGETARCH" = "arm64" || "$TARGETARCH" = "s390x" ]]; then \
        tar -C /usr/lib/splunk-otel-collector -xzf /dist/agent-bundle_linux_${TARGETARCH}.tar.gz && \
        /usr/lib/splunk-otel-collector/agent-bundle/bin/patch-interpreter /usr/lib/splunk-otel-collector/agent-bundle; \
    else \
        mkdir -p /usr/lib/splunk-otel-collector/agent-bundle; \
    fi
RUN rm -f /dist/agent-bundle_linux_${TARGETARCH}.tar.gz

FROM ${DOCKER_REPO}/alpine:3.17.0 AS jmx
ARG JMX_METRIC_GATHERER_RELEASE
RUN JMX_METRICS_JAR=opentelemetry-jmx-metrics.jar && \
   # URL=https://github.com/open-telemetry/opentelemetry-java-contrib/releases/download/${JMX_METRIC_GATHERER_RELEASE}/${JMX_METRICS_JAR} && \
    URL=https://github.com/open-telemetry/opentelemetry-java-contrib/releases/download/v1.38.0/opentelemetry-jmx-metrics.jar  && \
    cd /tmp && wget "$URL";

COPY --chown=999 config/collector/gateway_config.yaml /etc/otel/collector/gateway_config.yaml
COPY --chown=999 config/collector/otlp_config_linux.yaml /etc/otel/collector/otlp_config_linux.yaml
COPY --chown=999 config/collector/agent_config.yaml /etc/otel/collector/agent_config.yaml
COPY --chown=999 config/collector/fargate_config.yaml /etc/otel/collector/fargate_config.yaml
COPY --chown=999 config/collector/ecs_ec2_config.yaml /etc/otel/collector/ecs_ec2_config.yaml

FROM ${DOCKER_REPO}/debian:11.5 as journalctl
RUN apt update
RUN apt install -y systemd
COPY dist/collect-libs.sh /collect-libs.sh
RUN /collect-libs.sh /opt/journalctl /bin/journalctl

FROM scratch
ENV SPLUNK_BUNDLE_DIR=/usr/lib/splunk-otel-collector/agent-bundle
ENV SPLUNK_COLLECTD_DIR=${SPLUNK_BUNDLE_DIR}/run/collectd
ENV PATH=${PATH}:${SPLUNK_BUNDLE_DIR}/bin
ENV PATH=${PATH}:${SPLUNK_BUNDLE_DIR}/jre/bin

COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=otelcol /etc_passwd /etc/passwd
COPY --from=otelcol --chown=999 /otelcol /
COPY --from=otelcol --chown=999 /migratecheckpoint /
COPY --from=otelcol --chown=999 /otel /etc/otel
COPY --from=otelcol --chown=999 /otel/collector /etc/otel/collector
COPY --from=otelcol --chown=999 /tmp/tmp /tmp
COPY --from=agent-bundle --chown=999 /usr/lib/splunk-otel-collector /usr/lib/splunk-otel-collector
COPY --from=jmx --chown=999 /tmp/opentelemetry-jmx-metrics.jar /opt/opentelemetry-java-contrib-jmx-metrics.jar

COPY --from=journalctl --chown=999 /bin/journalctl /bin/journalctl
COPY --from=journalctl --chown=999 /opt/journalctl /

COPY --chown=999 config/collector/gateway_config.yaml /etc/otel/collector/gateway_config.yaml
COPY --chown=999 config/collector/otlp_config_linux.yaml /etc/otel/collector/otlp_config_linux.yaml
COPY --chown=999 config/collector/agent_config.yaml /etc/otel/collector/agent_config.yaml
COPY --chown=999 config/collector/fargate_config.yaml /etc/otel/collector/fargate_config.yaml
COPY --chown=999 config/collector/ecs_ec2_config.yaml /etc/otel/collector/ecs_ec2_config.yaml

USER splunk-otel-collector
ENTRYPOINT ["/otelcol"]
EXPOSE 13133 14250 14268 4317 4318 6060 8006 8888 9411 9443 9080

