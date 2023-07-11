pipeline {
    agent any
    environment{
        DOCKER_HUB_LOGIN = credentials('docker-hub')
        //TELEGRAM = credentials('telegram')
        REGISTRY = "roxsross12"
        APPNAME = "jenkins-demo"
        VERSION = "1.0.0"
    }
    stages{
        stage('Install Dependencias') {
            agent{
                docker {
                    image 'node:erbium-alpine'
                    args '-u root:root'
                }
            }
            steps {
                sh 'npm install'
            }
        }
        stage('Unit-test') {
            agent{
                docker {
                    image 'node:erbium-alpine'
                    args '-u root:root'
                }
            }
            steps {
                sh 'npm run test'
            }
        }
        stage('Docker Build') {
            steps {
                sh '''
                docker build -t $REGISTRY/$APPNAME:$VERSION .
                '''
            }
        }
        stage('Docker Push to Docker-hub') {
            steps {
                sh '''
                docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW
                docker push $REGISTRY/$APPNAME:$VERSION 
                '''
            }
        }
     } //end stages
} //End Pipeline
