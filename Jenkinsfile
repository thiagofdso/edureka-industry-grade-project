pipeline {
    agent any

    stages {
        stage('Code Checkout') {
            steps {
                git 'https://github.com/thiagofdso-edureka/edureka-jenkins-problem1.git'
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
    }
}