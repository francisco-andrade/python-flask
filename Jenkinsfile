pipeline {
  agent {
    docker {
      image 'jazzdd/alpine-flask'
      args '--entrypoint /bin/bash'
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