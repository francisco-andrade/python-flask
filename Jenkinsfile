pipeline {
    agent any

    environment {
        APP_NAME = "flask"
        IMAGE_PATH = "./"
        IMAGE_TAG = "${APP_NAME}:${BRANCH_NAME}.${BUILD_NUMBER}"
        DOCKER_CONTAINER_NAME = "${APP_NAME}${BUILD_NUMBER}"
        SERVICE_PORT = "8081"
        REMOVE_CONTAINER_AT_END = "true"
    }

    stages {
        stage('Build Container Image') {
            steps {
                checkout scm
                echo 'Building Docker Image'
                script {
                    def newImage = docker.build(IMAGE_TAG, IMAGE_PATH)
                }
            }
        }

        stage ('Container Tests') {
            steps {
                script {
                    echo 'Launch container'
                    sh """docker run -d -p ${env.SERVICE_PORT}:${env.SERVICE_PORT} --name ${env.DOCKER_CONTAINER_NAME} --entrypoint python ${env.IMAGE_TAG} /usr/src/app/app.py"""
                    env.CONTAINER_IP = sh (script: """docker inspect --format='{{ .NetworkSettings.IPAddress }}' ${env.DOCKER_CONTAINER_NAME}""", returnStdout: true).toString().trim()
                    echo 'Curl app'
                    env.CURL_OUTPUT = sh (script: """curl -s ${env.CONTAINER_IP}:${env.SERVICE_PORT}""", returnStdout: true).toString().trim().replaceAll("\r", "").replaceAll("\n", "")
                    echo 'Test curl result'
                    env.TEST_STRING = env.CURL_OUTPUT.toString().contains("here")
                    sh """if ${env.TEST_STRING}; then true; else false; fi"""
                }
            }
        }

        stage ('Unit Tests') {
            steps {
                echo 'Run Unit Tests'
            }
        }
    }

    post {
        always {
            sh """if ${env.REMOVE_CONTAINER_AT_END}; then echo 'Remove container'; docker rm -f ${env.DOCKER_CONTAINER_NAME} || true; else echo 'Container will not be removed' || true; fi"""
            echo "Finish..."
        }
    }
}