pipeline {
    agent {
        //docker { image 'node:7-alpine' }
        dockerfile {
            filename 'Dockerfile.build'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'python /usr/src/app/app.py &'
                sh 'node --version'
            }
        }
    }
}