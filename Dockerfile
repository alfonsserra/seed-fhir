### STAGE 1: Build ###

# We label our stage as 'builder'
FROM maven:3.6-jdk-11 as builder

## Storing node modules on a separate layer will prevent unnecessary npm installs at each build
RUN mkdir /seed-fhir

WORKDIR /seed-fhir

COPY . .

## Build the angular app in production mode and store the artifacts in dist folder
RUN mvn package

### STAGE 2: Setup ###

FROM openjdk:11.0.2-jdk

COPY --from=builder /seed-springboot/target/seed-fhir-1.0.jar seed-fhir.jar

CMD ["java","-jar","seed-fhir.jar"]
