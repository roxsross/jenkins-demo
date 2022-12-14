pipeline {
    agent none
    environment{
        APP_NAME= 'app-demo'
        REGISTRY ='roxsross12'
        DOCKER_HUB_LOGIN = credentials('docker-hub')
    }
    stages{
        stage ('checkout github'){
            steps{
                checkout scm
            }
        }  
        stage ('install dependencia'){
             agent {
                docker {
                    image 'node:erbium-alpine'
                    args '-u root:root'
                }           
            }
            steps{
                sh 'npm install'
            }
        }
        stage ('build'){
            steps{
                sh 'docker build -t $APP_NAME .'
                sh 'docker images'
            }
        }
        stage ('tag version'){
            steps{
                sh 'docker tag $APP_NAME:latest $REGISTRY/$APP_NAME:latest'
                sh 'docker images'
            }
        }
        stage ('Push'){
            steps{
                sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
                sh 'docker push $REGISTRY/$APP_NAME:latest'
            }   
        }
        stage ('deploy'){
            steps{
                sh 'echo DEPLOY'
            }   
        }
    }
}
