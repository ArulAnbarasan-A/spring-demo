pipeline {
	agent any
	
	environment {
		JAR_NAME = "spring-demo.jar"
		IMAGE_NAME = "spring-docker-demo"
		CONTAINER_NAME = "spring-docker-demo-container"
	}
	
	stages {
		stage('Checkout') {
			steps {
				git branch: 'master', url: 'https://github.com/ArulAnbarasan-A/spring-demo.git'
			}
		}
		stage('Build') {
			steps {
				bat 'mvn clean package'
			}
		}
		stage('Build Docker Image') {
			steps {
				bat """docker build -t %IMAGE_NAME% ."""
			}
		}
		stage('Deploy') {
			steps {
				bat """docker stop %CONTAINER_NAME% || exit 0 docker rm %CONTAINER_NAME% || exit 0"""
				bat """docker run -d -p 9030:9030 --name %CONTAINER_NAME% %IMAGE_NAME%"""
			}
		}
	}
	post {
		success {
			echo 'Build and deployment successful!'
		}
		failure {
			echo 'Build or deployment failed!'
		}
	}
}