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

## Livy spark-3.3.1

This version is rebuilt from [incubathttps://github.com/apache/incubator-livy/tree/v0.7.0-incubatingor](https://github.com/apache/incubator-livy/tree/v0.7.0-incubating) to make it run with spark-3.3.1

- SPARK installation (scala 2.12): https://archive.apache.org/dist/spark/spark-3.3.1/spark-3.3.1-bin-hadoop3.tgz
- Java: jdk8+
- Python; python3
- Adding to file ~/.bashrc:
  ```
  export SPARK_HOME=... (ex. export SPARK_HOME=/opt/spark-3.3.1-bin-hadoop3)
  export LIVY_HOME=... (ex. export LIVY_HOME=/opt/incubator-livy)
  export JAVA_HOME=... (ex. export JAVA_HOME=/opt/jdk1.8.0_331)
  ```
- After adding variables to ~/.bashrc, run: `source ~/.bashrc`
- Run: 
  
  * Extract file: `tar -xzvf apache-livy-0.8.0-incubating-SNAPSHOT-bin.tar.gz`
  * Rename folder: `mv apache-livy-0.8.0-incubating-SNAPSHOT-bin incubator-livy`
  * Move to foler: `cd incubator-livy`
  * Create log4j.properties: `cp conf/log4j.properties.template conf/log4j.properties`
  
- Edit the following config files to match your spark cluster information: 
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
    livy.spark.master = (ex. spark://master:7077)
    livy.spark.deploy-mode = (ex. client)

    # Whether or not to skip timeout check for a busy session
    livy.server.session.timeout-check.skip-busy = true

    # Time in milliseconds on how long Livy will wait before timing out an inactive session.
    # Note that the inactive session could be busy running jobs.    
    livy.server.session.timeout = 15m
    ```

- Start Livy:
 ```
 ./bin/livy-server start
 ```

> **Note**:
When u run spark-submit job and get error "jetty Illegal appears", you should consider open firewall port for all spark-nodes, this is not an error of this livy.
 
## Python lib for accessing Livy

- See this: https://pylivy.readthedocs.io/en/stable/index.html

- Example:
```
from livy import LivySession

LIVY_URL = "http://localhost:8998"

with LivySession.create(LIVY_URL,
         spark_conf={
           "spark.cores.max": 2,
           "spark.executor.cores": 2,
           "spark.executor.memory": "1g"
         }
     ) as session:
    session.run("""df = spark.sql("select 1 as t")""")
    session.run("df.show()")

```

## References for rebuiding Livy from source code:
[1] https://stackoverflow.com/questions/67085984/how-to-rebuild-apache-livy-with-scala-2-12
