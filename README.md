# docker-spark-cluster
Spark Cluster Demo Using Docker

```
$ sudo docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter
$ sudo mkdir -p _ssh && ssh-keygen -t rsa -N "" -f _ssh/id_rsa && cp _ssh/id_rsa.pub _ssh/authorized_keys
$ sudo docker build -t spark . 
$ sudo ./run-spark-cluster 
f7786...
$ sudo docker-enter f7786...
# cd /spark-1.2.1-bin-hadoop2.4 && ./bin/spark-submit --master spark://172.17.0.10:7077 examples/src/main/python/pi.py 100
```
Now, go to [http://172.17.0.10:8080/](http://172.17.0.10:8080/)
