#!/bin/bash

if [[ ! -z "$SPARK_MASTER" ]]; then
    /opt/spark/bin/spark-class org.apache.spark.deploy.master.Master
elif [[ ! -z "$SPARK_WORKER" ]]; then
    /opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker spark://$SPARK_MASTER_HOST:7077
else
    /opt/spark/bin/spark-submit \
      --class org.apache.spark.examples.SparkPi \
      local:///opt/spark/examples/jars/spark-examples_2.13-3.2.0.jar
    # Keep the driver pod alive after completion
    tail -f /dev/null
fi

