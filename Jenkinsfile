pipeline {
    agent any

    environment {
        NODEJS = 'node22'
        DOCKER_IMAGE_CLIENT = 'car-rental-client'
        DOCKER_IMAGE_SERVER = 'car-rental-server'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Node') {
            steps {
                nodejs(NODEJS) {
                    sh 'node -v'
                    sh 'npm -v'
                }
            }
        }

        stage('Client: Install & Build') {
            steps {
                dir('client') {
                    nodejs(NODEJS) {
                        sh 'npm install'
                        sh 'npm run build'
                    }
                }
            }
        }

        stage('Server: Install & Build') {
            steps {
                dir('server') {
                    nodejs(NODEJS) {
                        sh 'npm install'
                        sh 'npm run build'
                    }
                }
            }
        }

        stage('Client: Tests') {
            steps {
                dir('client') {
                    nodejs(NODEJS) {
                        sh 'npm test || true'
                    }
                }
            }
        }

        stage('Lint') {
            steps {
                dir('client') {
                    nodejs(NODEJS) {
                        sh 'npm run lint || true'
                    }
                }

                dir('server') {
                    nodejs(NODEJS) {
                        sh 'npm run lint || true'
                    }
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t car-rental-client ./client'
                sh 'docker build -t car-rental-server ./server'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker compose down'
                sh 'docker compose up -d --build'
            }
        }
    }

    post {
        always {
            echo "Pipeline finished"
        }
    }
}