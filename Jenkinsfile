pipeline {
    agent none
    stages {
        stage('Test') {
            agent {
                docker {
                    image 'jazzdd/alpine-flask'
                    args '-v $HOME/:/app'
                }
            }
            steps {
                sh 'pwd'
                sh 'ls'
                sh 'wget localhost:8081'
                sh 'cat index.html'
            }
        }
    }
}