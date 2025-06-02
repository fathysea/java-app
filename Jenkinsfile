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
                    
                    // Method 1: Using sshagent with proper error handling
                    try {
                        sshagent(['ec2-ssh']) {
                            sh """
                                ssh -o StrictHostKeyChecking=no \
                                    -o UserKnownHostsFile=/dev/null \
                                    -o ConnectTimeout=10 \
                                    ec2-user@54.191.105.177 \
                                    '${dockerCMD}'
                            """
                        }
                    } catch (Exception e) {
                        echo "SSH Agent failed: ${e.getMessage()}"
                        echo "Trying alternative method..."
                        
                        // Method 2: Alternative using withCredentials
                        withCredentials([sshUserPrivateKey(credentialsId: 'ec2-ssh', keyFileVariable: 'SSH_KEY', usernameVariable: 'SSH_USER')]) {
                            sh """
                                chmod 400 \${SSH_KEY}
                                ssh -i \${SSH_KEY} \
                                    -o StrictHostKeyChecking=no \
                                    -o UserKnownHostsFile=/dev/null \
                                    -o ConnectTimeout=10 \
                                    ec2-user@54.191.105.177 \
                                    '${dockerCMD}'
                            """
                        }
                    }
                }
            }
        }
    }
}
