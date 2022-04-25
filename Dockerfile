# BUILD STAGE
FROM maven as build
WORKDIR /usr/app
COPY  pom.xml /usr/app/pom.xml
COPY src /usr/app/src
RUN mvn clean package

# RUN STAGE
FROM  openjdk:alpine
COPY --from=build /usr/app/target/metadata-service.jar .
ENTRYPOINT java -jar metadata-service.jar

