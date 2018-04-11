pipeline {
    agent {
        //docker { image 'node:7-alpine' }
        dockerfile true
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}