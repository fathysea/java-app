#!/usr/bin/env groovy

pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                script {
                    echo "Building the application..."
                }
            }
        }
        stage('test') {
            steps {
                script {
                    echo "Testing the application..."
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                    def dockerCMD = 'docker stop flask-app || true \ 
                                        docker rm flask-app || true \ 
        docker volume create flask_data || true \ 
        docker network create flask-network || true \ 
        docker run -d \
            -p 5000:5000 \
            --name flask-app \
            --restart unless-stopped \
            --network flask-network \
            -v flask_data:/app/data \
            -e SECRET_KEY=production-secret-key-${BUILD_NUMBER} \
            -e FLASK_ENV=production \
            khaledhawil/flask-app '
                    echo "Deploying the application with command: ${dockerCMD}"
                    sshagent(['ec2-server-key']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@54.191.105.177 '${dockerCMD}'"
                    }
                }
            }
        }
    }
}
