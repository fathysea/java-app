#!/usr/bin/env groovy

pipeline {
    agent none
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
                    def dockerCMD = 'docker run -d -p 5000:5000 khaledhawil/flask-app
                    sshagent(['ec2-ssh']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@54.191.105.177 ${dockerCMD}"
                    }
                }
            }
        }
    }
}
