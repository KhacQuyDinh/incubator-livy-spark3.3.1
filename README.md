# Apache Livy

[![Build Status](https://travis-ci.org/apache/incubator-livy.svg?branch=master)](https://travis-ci.org/apache/incubator-livy)

Apache Livy is an open source REST interface for interacting with
[Apache Spark](http://spark.apache.org) from anywhere. It supports executing snippets of code or
programs in a Spark context that runs locally or in
[Apache Hadoop YARN](http://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html).

* Interactive Scala, Python and R shells
* Batch submissions in Scala, Java, Python
* Multiple users can share the same server (impersonation support)
* Can be used for submitting jobs from anywhere with REST
* Does not require any code change to your programs

[Pull requests](https://github.com/apache/incubator-livy/pulls) are welcomed! But before you begin,
please check out the [Contributing](http://livy.incubator.apache.org/community#Contributing)
section on the [Community](http://livy.incubator.apache.org/community) page of our website.

## Online Documentation

Guides and documentation on getting started using Livy, example code snippets, and Livy API
documentation can be found at [livy.incubator.apache.org](http://livy.incubator.apache.org).

## Before Running Livy

To build Livy, you will need:

Debian/Ubuntu:
  * mvn (from ``maven`` package or maven3 tarball)
  * openjdk-8-jdk (or Oracle JDK 8)
  * Python 2.7+
  * R 3.x

Redhat/CentOS:
  * mvn (from ``maven`` package or maven3 tarball)
  * java-1.8.0-openjdk (or Oracle JDK 8)
  * Python 2.7+
  * R 3.x

MacOS:
  * Xcode command line tools
  * Oracle's JDK 1.8
  * Maven (Homebrew)
  * Python 2.7+
  * R 3.x

Required python packages for building Livy:
  * cloudpickle
  * requests
  * requests-kerberos
  * flake8
  * flaky
  * pytest


To run Livy, you will also need a Spark installation. You can get Spark releases at
https://spark.apache.org/downloads.html.

Livy requires Spark 2.4+. You can switch to a different version of Spark by setting the
``SPARK_HOME`` environment variable in the Livy server process, without needing to rebuild Livy.


## Livy spark-3.3.1

This version is rebuilt from [incubathttps://github.com/apache/incubator-livy/tree/v0.7.0-incubatingor](https://github.com/apache/incubator-livy/tree/v0.7.0-incubating) to make it run with spark-3.3.1

- Edit config files: 
  - conf/livy-env.sh
    ```
    export SPARK_CONF_DIR=spark-3.3.1-bin-hadoop3/conf
    export LIVY_LOG_DIR=incubator-livy/logs
    export PYSPARK_PYTHON=/usr/bin/python3
    export PYSPARK_DRIVER_PYTHON=/usr/bin/python3
    export LIVY_SERVER_JAVA_OPTS="-Xmx2g"

    ```
  - livy.conf
    ```
    livy.server.host = localhost
    livy.server.port = 8998
    livy.spark.master = 
    livy.spark.deploy-mode = 
    ```

> **Note**:
When u run spark-submit job and get error "jetty Illegal appears", you should consider open firewall port for all spark-nodes, this is not an error of this livy.

- Start Livy:
 ```
 ./bin/livy-server start
 ```
 
## Python lib for accessing Livy

See this: https://pylivy.readthedocs.io/en/stable/index.html

## References for rebuiding Livy from source code:
[1] https://stackoverflow.com/questions/67085984/how-to-rebuild-apache-livy-with-scala-2-12
