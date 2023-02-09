pipeline {
    agent any
    environment{
        DOCKER_HUB_LOGIN = credentials('docker-hub')
    }
    stages{
         stage ('version'){
            steps{
                sh 'chmod +x version.sh;./version.sh'
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
