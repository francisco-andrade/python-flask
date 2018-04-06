pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            additionalBuildArgs '-p 8081:8081'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'wget localhost:8081'
                sh 'cat index.html'
            }
        }
    }
}