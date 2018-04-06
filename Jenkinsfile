pipeline {
    agent none
    stages {
        stage('Test') {
            agent { dockerfile true }
            steps {
                sh 'pwd'
                sh 'ls'
                sh 'wget localhost:8081'
                sh 'cat index.html'
            }
        }
    }
}