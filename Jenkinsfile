pipeline {
  agent {
    docker {
      image 'jazzdd/alpine-flask'
      args '-p 80:80  -v /tmp:/app'
    }
    
  }
  stages {
    stage('Test') {
      steps {
        sh 'node --version'
      }
    }
  }
}