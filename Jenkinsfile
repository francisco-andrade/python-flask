pipeline {
  agent {
    docker {
      image 'jazzdd/alpine-flask'
    }
    
  }
  stages {
    stage('Initialize') {
      steps {
        echo 'Starting pipeline'
        sh '''pwd
echo $PATH'''
      }
    }
  }
}