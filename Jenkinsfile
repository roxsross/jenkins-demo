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
        stage('deploy) {
            steps {
                sh 'kubectl apply -f pod.yaml'
            }
        }
     } //end stages
} //End Pipeline
