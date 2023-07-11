pipeline {
    agent any
    environment{
        DOCKER_HUB_LOGIN = credentials('docker-hub')
    }
    stages{
        stage('deploy){
            steps {
                sh 'kubectl apply -f pod.yaml'
            }
        }
     } //end stages
} //End Pipeline
