pipeline {
    agent {
        docker { 
            image 'node:7-alpine'
            args '-v ./:/app'
            }
    }
    stages {
        stage('Test') {
            steps {
                sh 'wget localhost:8081'
                sh 'cat index.html'
            }
        }
    }
}