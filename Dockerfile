# ---- Build Stage ----
FROM eclipse-temurin:25-jdk-alpine AS build
WORKDIR /app

COPY build.gradle settings.gradle ./
COPY src ./src

RUN ./gradlew bootJar --no-daemon || echo "Skipping gradle build for placeholder"

# ---- Runtime Stage ----
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app

LABEL maintainer="Ussenkan Yersultan"

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]