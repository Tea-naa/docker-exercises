# Dockerized Java Application Deployment

Containerized Java application deployed with MySQL and phpMyAdmin using Docker and Docker Compose. The project includes persistent database storage, environment-based configuration, container health checks, a private Nexus Docker registry, and remote deployment to DigitalOcean.

## Architecture

```text
Java Application
      |
      v
MySQL Database
      ^
      |
phpMyAdmin
```

The application stack runs as three Docker containers managed through Docker Compose:

- **Java Application** — Spring Boot application running on port `8080`
- **MySQL** — application database running on port `3306`
- **phpMyAdmin** — browser-based database management interface running on port `8081`

## Technologies

- Docker
- Docker Compose
- Java / Spring Boot
- Gradle
- MySQL
- phpMyAdmin
- Sonatype Nexus Repository
- DigitalOcean
- Linux
- Git / GitHub

## Containerization

The Java application is built with Gradle into a deployable JAR:

```bash
gradle build
```

A Dockerfile packages the JAR with a Java runtime to create the application image:

```bash
docker build -t docker-exercises-app .
```

## Docker Compose

Docker Compose manages the Java application, MySQL database, and phpMyAdmin containers as a single application stack.

The configuration includes:

- Container networking
- Environment-based database configuration
- Persistent MySQL storage using a Docker volume
- MySQL health checks
- Application dependency on a healthy database
- Port mappings for the application and database management interface

The stack can be started with:

```bash
docker compose up -d
```

## Private Docker Registry

The Java application image was published to a private Docker registry hosted with Sonatype Nexus Repository.

Deployment workflow:

```text
Java Source Code
      ↓
Gradle Build
      ↓
JAR
      ↓
Docker Build
      ↓
Docker Image
      ↓
Nexus Registry
      ↓
Remote Server
      ↓
Docker Compose
```

This allows deployment servers to pull the packaged application image directly from the private registry instead of rebuilding the application on the server.

## Cloud Deployment

The application stack was deployed to a DigitalOcean Ubuntu server.

The deployment process included:

1. Provisioning a Linux cloud server
2. Installing Docker and Docker Compose
3. Configuring access to the private Nexus Docker registry
4. Authenticating the deployment server with Nexus
5. Transferring the Docker Compose configuration to the server
6. Pulling the application image from Nexus
7. Starting the complete application stack with Docker Compose
8. Verifying the application through the server's public endpoint

## Key DevOps Concepts Demonstrated

- Application containerization
- Docker image creation
- Multi-container orchestration with Docker Compose
- Container networking
- Persistent database storage
- Environment-based configuration
- Service health checks and dependencies
- Private artifact and image management with Nexus
- Cloud server provisioning
- Remote container deployment
