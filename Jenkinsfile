pipeline {
    agent {
        docker { image 'python:2.7-jessie' }
        // dockerfile {
        //     filename 'Dockerfile.build'
        // }
    }
    stages {
        stage('Test') {
            steps {
                //sh 'python /usr/src/app/app.py &'
                sh 'python --version'
            }
        }
    }
}