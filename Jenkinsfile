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
      }
    }
    stage('Shellscript') {
      steps {
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