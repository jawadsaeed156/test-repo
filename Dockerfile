FROM 524540894843.dkr.ecr.eu-west-1.amazonaws.com/java-eclipse-temurin-21:latest
RUN groupadd -r digitify && useradd -r -g digitify digitify
USER digitify
WORKDIR /app
COPY target/dob-*.jar /app/dob-api.jar
EXPOSE 8080
ENTRYPOINT java -XX:+PrintFlagsFinal -XX:MaxRAMPercentage=70.0 -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp/heap-dump-$(date '+%s').hprof -jar dob-api.jar
