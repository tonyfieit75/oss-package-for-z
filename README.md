# Create the README.md content
readme_content = """
# OpenSource Project Documentation

This repository contains various resources, including Dockerfiles, configuration files, and scripts for setting up and managing open-source tools and services.

## Directory Structure

Below is an overview of the folder structure and their contents:

### `Opensource/airflow`
- **Files**:
  - `airflow-scheduler-StatsD-deployment.yaml`: Deployment file for the Airflow scheduler with StatsD integration.
  - `Dockerfile-k8s.10.17.24`: Dockerfile for Kubernetes integration.
  - `Dockerfile.10.17.24`: Dockerfile for Airflow deployment.
  - `image.txt`: Contains Docker image details.

### `Opensource/apache spark`
- **Files**:
  - `Dockerfile`: Standard Dockerfile for Apache Spark.
  - `Dockerfile.10.1.24`: Alternative Dockerfile for Apache Spark.
  - `image.txt`: Contains Docker image details.

#### `Opensource/apache spark/files`
- **Files**:
  - Various entrypoint scripts (`entrypoint.sh` variations) for Spark deployment.
  - Kubernetes configuration files (`mutatingwebhookconfiguration-spark-operator-webhook.yaml`, `spark-operator-controller.yaml`, etc.).

### `Opensource/external-secrets`
- **Files**:
  - `Dockerfile.s390x`: Dockerfile for IBM s390x architecture.
  - `Dockerfile.ubi`: Dockerfile for UBI-based builds.
  - `images.txt`: Contains Docker image details.
  - `ubi-build-files-s390x.txt`: Build instructions for s390x architecture.

#### `Opensource/external-secrets/deployments`
- **Files**:
  - Various Kubernetes deployment YAML files for external secrets and Vault integration.

### `Opensource/nats-box`
- **Files**:
  - `Dockerfile`: Dockerfile for NATS Box.

### `Opensource/nats-operator`
- **Files**:
  - `Dockerfile.s390x`: Dockerfile for IBM s390x architecture.
  - `images`: Contains Docker image details.

### `Opensource/reloader`
- **Files**:
  - `Dockerfile`: Standard Dockerfile for the Reloader tool.
  - `Dockerfile.ubi`: Dockerfile for UBI-based builds.

### `Opensource/spark-operator`
- **Files**:
  - Multiple Dockerfiles for different Spark operator configurations.
  - `image.txt`: Contains Docker image details.
  - Kubernetes configuration files for the Spark operator (`spark-operator-webhook-role.yaml`, `spark-service-account.yaml`, etc.).

### `Opensource/splunk-otel-collector`
- **Files**:
  - `Dockerfile`: Dockerfile for Splunk OTEL Collector.

#### `Opensource/splunk-otel-collector/docker`
- **Files**:
  - `.env`: Environment file.
  - `docker-compose.yml`: Docker Compose file.
  - `README.md`: Existing documentation for Splunk OTEL Collector.

#### Subdirectories
This folder contains Dockerfiles and configuration files for various services (e.g., Apache, MySQL, Redis). Each service folder includes relevant Dockerfiles and scripts.

### `Opensource/Vault`
- **Files**:
  - `Dockerfile`: Dockerfile for Vault.
  - `image.txt`: Contains Docker image details.

## Usage Instructions

1. **Clone the Repository**:
   ```bash
   git clone <repository_url>
   cd Opensource


