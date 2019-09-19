[![Build Status](https://travis-ci.org/systelab/seed-fhir.svg?branch=master)](https://travis-ci.org/systelab/seed-fhir)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/7ce4e563c45b4d09a975d61bed7d5d50)](https://www.codacy.com/app/alfonsserra/seed-fhir?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=systelab/seed-fhir&amp;utm_campaign=Badge_Grade)
[![Known Vulnerabilities](https://snyk.io/test/github/systelab/seed-fhir/badge.svg?targetFile=pom.xml)](https://snyk.io/test/github/systelab/seed-fhir?targetFile=pom.xml)

# `seed-fhir` — FHIR Server

This project is an application skeleton for a FHIR backend application. 

## Getting Started

To get you started you can simply clone the `seed-fhir` repository and install the dependencies:

### Prerequisites

You need [git][git] to clone the `seed-fhir` repository.

You will need [OpenJDK 11][jdk-download] and [Maven][maven].

### Clone `seed-fhir`

Clone the `seed-fhir` repository using git:

```bash
git clone https://github.com/systelab/seed-fhir.git
cd seed-fhir
```

### Install Dependencies

In order to install the dependencies and generate the Uber jar you must run:

```bash
mvn clean install
```

### Run

To launch the server, simply run with java -jar the generated jar file.

```bash
cd target
java -jar seed-fhir-1.0.jar
```

## API

```bash
curl --header "Content-Type: application/fhir+json" --data '{"resourceType": "Patient","identifier": [ { "system": "urn:oid:1.2.36.146.595.217.0.1", "value": "12345" } ],"name": [ {"family": "Chalmers","given": [ "Peter", "James" ]} ],"gender": "male","birthDate": "1974-12-25"}' -X POST http://localhost:8080/fhir/Patient
curl http://localhost:8080/fhir/Patient/1
```

## Docker

### Build docker image

There is an Automated Build Task in Docker Cloud in order to build the Docker Image. 
This task, triggers a new build with every git push to your source code repository to create a 'latest' image.
There is another build rule to trigger a new tag and create a 'version-x.y.z' image

You can always manually create the image with the following command:

```bash
docker build -t systelab/seed-fhir . 
```

### Run the container

```bash
docker run -p 8443:8443 -p 8080:8080 systelab/seed-fhir
```

The app will be available at http://localhost:8080/fhir



[git]: https://git-scm.com/
[sboot]: https://projects.spring.io/spring-boot/
[maven]: https://maven.apache.org/download.cgi
[jdk-download]: https://adoptopenjdk.net/
[JEE]: http://www.oracle.com/technetwork/java/javaee/tech/index.html
[jwt]: https://jwt.io/
[cors]: https://en.wikipedia.org/wiki/Cross-origin_resource_sharing
[swagger]: https://swagger.io/
[allure]: https://docs.qameta.io/allure/
[junit]: https://junit.org/junit5/


