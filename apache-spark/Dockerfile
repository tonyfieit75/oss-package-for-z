# Use Alpine as the base image for s390x architecture
FROM s390x/alpine:3.16

# Set environment variables for Spark and Hadoop
ENV SPARK_HOME=/opt/spark
ENV HADOOP_HOME=${SPARK_HOME}
ENV LD_LIBRARY_PATH=${HADOOP_HOME}/lib/native:$LD_LIBRARY_PATH

# Install system dependencies, OpenJDK, and tools
#RUN apk add --no-cache openjdk11 wget bash git tar gzip procps gcc make musl-dev

# Install essential packages and tools for Spark and Hadoop
RUN apk update && \
    apk add --no-cache \
    openjdk11 \
    wget \
    bash \
    git \
    tar \
    gzip \
    procps \
    gcc \
    make \
    musl-dev \
    tini

# Download and install Apache Spark
RUN mkdir -p ${SPARK_HOME} && \
    wget https://archive.apache.org/dist/spark/spark-3.4.1/spark-3.4.1-bin-hadoop3.tgz && \
    tar -xzf spark-3.4.1-bin-hadoop3.tgz -C /opt && \
    mv /opt/spark-3.4.1-bin-hadoop3/* ${SPARK_HOME} && \
    rm -rf spark-3.4.1-bin-hadoop3.tgz

# Download and install Hadoop native libraries
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz && \
    tar -xzf hadoop-3.3.0.tar.gz && \
    mkdir -p ${SPARK_HOME}/lib/native && \
    cp -r hadoop-3.3.0/lib/native ${SPARK_HOME}/lib/native && \
    rm -rf hadoop-3.3.0*

# Set up environment variables for Spark
ENV PATH="${SPARK_HOME}/bin:${PATH}"

# Change ownership of the Spark directory to the spark user
RUN adduser -D spark && chown -R spark:spark ${SPARK_HOME}

# Create a directory for Spark logs
RUN mkdir -p /opt/spark/logs && \
    chmod -R 777 /opt/spark/logs && \
    chown -R spark:spark /opt/spark/logs

# Expose the necessary ports for Spark
EXPOSE 4040 8080

# Switch to the spark user
USER spark

# Default entry point to launch Spark Shell
ENTRYPOINT ["spark-shell"]

