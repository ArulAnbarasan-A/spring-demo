FROM openjdk:17-jdk-slim
EXPOSE 9030
ADD target/spring-demo.jar spring-demo.jar
CMD ["java", "-jar", "spring-demo.jar"]