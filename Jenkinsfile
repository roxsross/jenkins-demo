pipeline {
    agent any
    environment{
        DOCKER_HUB_LOGIN = credentials('docker-hub')
        TELEGRAM = credentials('telegram')
        REGISTRY = "roxsross12"
        APPNAME = "jenkins-demo"
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
                export VERSION=$( jq --raw-output .version package.json )
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
       stage('Notificacion') {
            steps {
                sh 'chmod +x ./telegram.sh'
                sh './telegram.sh'
            }
        }
     } //end stages
} //End Pipeline
