pipeline {
    agent any

    environment {
        APP_NAME = "flask"
        IMAGE_PATH = "./"
        IMAGE_TAG = "${APP_NAME}:${BRANCH_NAME}.${BUILD_NUMBER}"
        DOCKER_CONTAINER_NAME = "${APP_NAME}${BUILD_NUMBER}"
        SERVICE_PORT = "8888"
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
                    sh """docker run -d -p ${env.SERVICE_PORT}:${env.SERVICE_PORT} --name ${env.DOCKER_CONTAINER_NAME} --entrypoint python ${env.IMAGE_TAG} /usr/src/app/app.py"""
                    env.CONTAINER_IP = sh (script: """docker inspect --format='{{ .NetworkSettings.IPAddress }}' ${env.DOCKER_CONTAINER_NAME}""", returnStdout: true).toString().trim()
                    sh """echo ${env.CONTAINER_IP}"""
                    sh """curl ${env.CONTAINER_IP}:${env.SERVICE_PORT}"""
                    sh """docker exec -t ${env.DOCKER_CONTAINER_NAME} /usr/bin/curl localhost:${env.SERVICE_PORT}"""
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