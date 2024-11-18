# OpenSource Components for IBM LinuxONE on Red Hat OpenShift

This repository includes a collection of open-source components and workloads designed specifically for deployment on **IBM LinuxONE** systems running **Red Hat OpenShift**. These components leverage the unique capabilities of IBM LinuxONE, including scalability, security, and performance, while ensuring compatibility with OpenShift environments.

## Directory Structure and Descriptions

## Directory Structure

Below is an overview of the folder structure and their contents:

### `apache-airflow`
- **Purpose**: Deployment resources for Apache Airflow, a platform for orchestrating complex workflows.
- **Files**:
  - `airflow-scheduler-StatsD-deployment.yaml`: Deployment file for the Airflow scheduler with StatsD integration.
  - `Dockerfile-k8s.10.17.24`: Dockerfile for Kubernetes integration.
  - `Dockerfile.10.17.24`: Dockerfile for Airflow deployment.
  - `image.txt`: Contains Docker image details.

### `apache-spark`
- **Files**:
  - `Dockerfile`: Standard Dockerfile for Apache Spark.
  - `Dockerfile.10.1.24`: Alternative Dockerfile for Apache Spark.
  - `image.txt`: Contains Docker image details.

#### `apache-spark/files`
- **Purpose**: Resources for deploying Apache Spark on IBM LinuxONE.
- **Files**:
  - Various entrypoint scripts (`entrypoint.sh` variations) for Spark deployment.
  - Kubernetes configuration files (`mutatingwebhookconfiguration-spark-operator-webhook.yaml`, `spark-operator-controller.yaml`, etc.).

### `external-secrets`
- **Purpose**: Manage external secrets securely on Kubernetes using IBM LinuxONE.
- **Files**:
  - `Dockerfile.s390x`: Dockerfile for IBM s390x architecture.
  - `Dockerfile.ubi`: Dockerfile for UBI-based builds.
  - `images.txt`: Contains Docker image details.
  - `ubi-build-files-s390x.txt`: Build instructions for s390x architecture.

#### `external-secrets/deployments`
- **Files**:
  - Various Kubernetes deployment YAML files for external secrets and Vault integration.

### `nats-box`
- **Files**:
  - `Dockerfile`: Dockerfile for NATS Box.

### `nats-operator`
- **Files**:
  - `Dockerfile.s390x`: Dockerfile for IBM s390x architecture.
  - `images`: Contains Docker image details.

### `reloader`
- **Files**:
  - `Dockerfile`: Standard Dockerfile for the Reloader tool.
  - `Dockerfile.ubi`: Dockerfile for UBI-based builds.

### `spark-operator`
- **Files**:
  - Multiple Dockerfiles for different Spark operator configurations.
  - `image.txt`: Contains Docker image details.
  - Kubernetes configuration files for the Spark operator (`spark-operator-webhook-role.yaml`, `spark-service-account.yaml`, etc.).

### `splunk-otel-collector`
- **Files**:
  - `Dockerfile`: Dockerfile for Splunk OTEL Collector.

#### `splunk-otel-collector/docker`
- **Files**:
  - `.env`: Environment file.
  - `docker-compose.yml`: Docker Compose file.
  - `README.md`: Existing documentation for Splunk OTEL Collector.

#### Subdirectories
This folder contains Dockerfiles and configuration files for various services (e.g., Apache, MySQL, Redis). Each service folder includes relevant Dockerfiles and scripts.

### `hashicorp-vault`
- **Files**:
  - `Dockerfile`: Dockerfile for Vault.
  - `image.txt`: Contains Docker image details.

## Usage Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/tonyfieit75/oss-package-for-z.git
   cd oss-package-for-z


