pipeline {
  agent {
    docker {
      image 'jazzdd/alpine-flask'
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