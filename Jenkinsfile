pipeline {
    agent any
    environment{
        DOCKER_HUB_LOGIN = credentials('docker-hub')
    }
    stages{
         stage ('version'){
            steps{
                sh '. ./version.sh'
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
