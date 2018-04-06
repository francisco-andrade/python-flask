pipeline {
    agent {
        docker {
            image 'jazzdd/alpine-flask'
            args '-v $HOME/:/app'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'pwd'
                sh 'ls'
                sh 'wget localhost:8081'
                sh 'cat index.html'
            }
        }
    }
}