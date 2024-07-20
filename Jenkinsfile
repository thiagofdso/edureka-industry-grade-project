pipeline {
    agent any

    stages {
        stage('Code Checkout') {
            steps {
                git 'https://github.com/thiagofdso/edureka-industry-grade-project.git''
            }
        }

        stage('Code Compile') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('Test'){
            steps {
                sh 'mvn test'
            }
        }

        stage('Package'){
            steps {
                sh 'mvn package'
            }
        }
    }
}