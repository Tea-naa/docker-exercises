FROM eclipse-temurin:17-jre

WORKDIR /app

COPY build/libs/docker-exercises-project-1.0-SNAPSHOT.jar app.jar

CMD ["java", "-jar", "app.jar"]