pipeline {
    agent {
        dockerfile true
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