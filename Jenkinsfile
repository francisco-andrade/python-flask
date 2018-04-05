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
    stage('Build') {
      steps {
        sh 'python hello.py'
      }
    }
    stage('Test it') {
      steps {
        sh 'curl http://localhost:80/'
      }
    }
  }
}