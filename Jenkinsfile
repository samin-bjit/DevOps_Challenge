pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = 'your-registry-url'
        DOCKER_CREDENTIALS = 'docker-credentials-id'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build & Test API') {
            steps {
                dir('api') {
                    sh 'composer install'
                    sh 'php artisan test'
                }
            }
        }
        
        stage('Build & Test Frontend') {
            steps {
                dir('frontend') {
                    sh 'npm install'
                    sh 'npm test'
                }
            }
        }
        
        stage('Build Docker Images') {
            steps {
                script {
                    docker.build("${DOCKER_REGISTRY}/frontend:${BUILD_NUMBER}", "./frontend")
                    docker.build("${DOCKER_REGISTRY}/api:${BUILD_NUMBER}", "./api")
                }
            }
        }
        
        stage('Push Docker Images') {
            steps {
                script {
                    docker.withRegistry(DOCKER_REGISTRY, DOCKER_CREDENTIALS) {
                        docker.image("${DOCKER_REGISTRY}/frontend:${BUILD_NUMBER}").push()
                        docker.image("${DOCKER_REGISTRY}/api:${BUILD_NUMBER}").push()
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
    
    post {
        failure {
            emailext (
                subject: "Pipeline Failed: ${currentBuild.fullDisplayName}",
                body: "Pipeline failed at stage: ${currentBuild.description}",
                recipientProviders: [[$class: 'DevelopersRecipientProvider']]
            )
        }
    }
}