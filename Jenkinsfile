pipeline {
    agent any
    environment{
        DOCKER_HUB_LOGIN = credentials('docker-hub-roxs')
        BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
    }
    stages{
         stage ('version'){
            steps{
                sh 'source ./version.sh'
                sh 'echo $VERSION'
                echo 'Branch $BRANCH_NAME'
            }
        }
        stage ('tag version'){
            steps{
                echo 'version $VERSION'
                echo 'Branch $BRANCH_NAME'
                }
        }
     } //end stages
} //End Pipeline
