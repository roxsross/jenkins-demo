pipeline {
    agent any
    environment{
        DOCKER_HUB_LOGIN = credentials('docker-hub')
        //TELEGRAM = credentials('telegram')
        REGISTRY = "roxsross12"
        APPNAME = "jenkins-demo"
    }
    stages{
        stage('Check Version') {
            steps {
                sh '''
                VERSION=$( jq --raw-output .version package.json ) 
                echo $VERSION > version.txt
                '''
            }
        }
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
                docker build -t $REGISTRY/$APPNAME:$(cat version.txt) .
                '''
            }
        }
        stage('Docker Push to Docker-hub') {
            steps {
                sh '''
                docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW
                docker push $REGISTRY/$APPNAME:$(cat version.txt)
                '''
            }
        }
     } //end stages
} //End Pipeline
