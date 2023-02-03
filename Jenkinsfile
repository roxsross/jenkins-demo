pipeline {
    agent any
    environment{
        DOCKER_HUB_LOGIN = credentials('docker-hub-roxs')
    }
    stages{
         stage ('version'){
            steps{
                sh 'source ./version.sh'
                sh 'echo $VERSION'
            }
        }
        stage ('tag version'){
            steps{
                echo 'version $VERSION'
                }
        }
     } //end stages
} //End Pipeline
