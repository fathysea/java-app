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
                    def dockerCMD = 'docker run -d -p 5000:5000 khaledhawil/flask-app'
                    echo "Deploying the application with command: ${dockerCMD}"
                    sshagent(['ec2-server-key']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@54.191.105.177 '${dockerCMD}'"
                    }
                }
            }
        }
    }
}
