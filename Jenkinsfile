pipeline {
    agent any

    environment {
        APP_NAME = "flask"
        IMAGE_PATH = "./"
        IMAGE_TAG = "${APP_NAME}:${BRANCH_NAME}.${BUILD_NUMBER}"
        DOCKER_CONTAINER_NAME = "${APP_NAME}${BUILD_NUMBER}"
        REMOVE_CONTAINER_AT_END = "false"
    }

    stages {
        stage('Build Container Image') {
            steps {
                echo 'Building Docker Image'
                script {
                    def newImage = docker.build(IMAGE_TAG, IMAGE_PATH)
                }
            }
        }

        stage ('Container Tests')
        {
            steps {
                script {
                    echo 'Launch container'
                    sh """docker run -d -p 8888:8888 --name ${env.DOCKER_CONTAINER_NAME} --entrypoint python ${env.IMAGE_TAG} /usr/src/app/app.py"""
                    sh """docker exec -t ${env.DOCKER_CONTAINER_NAME} curl localhost:8888"""
                }
            }
        }

        stage ('Unit Tests')
        {
            steps {
                echo 'Run Unit Tests'
            }
        }
    }

    post {
        always {
            echo 'Remove container'
            sh """if ${env.REMOVE_CONTAINER_AT_END}; then docker rm -f ${env.DOCKER_CONTAINER_NAME} || true; fi"""
        }
    }
}