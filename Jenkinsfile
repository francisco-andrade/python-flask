pipeline {
  agent {
    docker {
      image 'jazzdd/alpine-flask'
    }
    
  }
  stages {
    stage('Initialize') {
      agent {
        docker {
          image 'jazzdd/alpine-flask'
        }
        
      }
      steps {
        echo 'Starting pipeline'
        sh '''pwd
echo $PATH'''
      }
    }
  }
}