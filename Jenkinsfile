pipeline {
    agent any

    stages {
        stage('Code Checkout') {
            steps {
                git 'https://github.com/thiagofdso/edureka-industry-grade-project.git'
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

        stage('install podman using ansible'){
            steps {
                sh 'ansible-playbook -i inventario_local.ini podman.yml'
            }
        }
        stage('Build Docker Image'){
            steps {
                sh 'cp /var/lib/jenkins/workspace/$JOB_NAME/target/ABCtechnologies-1.0.war abc_tech.war'
                sh 'podman build -t abc_tech:$BUILD_NUMBER .'
                sh 'podman tag abc_tech:$BUILD_NUMBER thiagofdso/abc_tech:$BUILD_NUMBER'
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                        sh 'podman login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD docker.io'
                        sh 'podman push thiagofdso/abc_tech:$BUILD_NUMBER'
                    }
                }
            }
        }
        stage('Deploy as container'){
            steps {
                sh 'podman run -itd -P thiagofdso/abc_tech:$BUILD_NUMBER'
            }
        }
        stage('Deploy to kubernetes'){
            steps {
                sh 'ansible-playbook -i inventario_local.ini deployk8s.yml'
            }
        }
    }
}