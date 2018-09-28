
FROM openjdk:8-jre-alpine

COPY target/producer-service.jar /opt/

ENV JVM_LIMIT_OPTS='-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap'
# 128mb ram
# ENV HEAP_SIZE='128m'
# ENV META_SIZE='64m'
# 256mb ram
ENV HEAP_SIZE='256m'
ENV META_SIZE='128m'
# 1gb ram
# ENV HEAP_SIZE='1024m'
# ENV META_SIZE='512m'

WORKDIR /opt

EXPOSE 8080

ENTRYPOINT exec java -server $JVM_LIMIT_OPTS -Xms$HEAP_SIZE -Xmx$HEAP_SIZE -XX:MaxMetaspaceSize=$META_SIZE $JAVA_OPTS -jar producer-service.jar
