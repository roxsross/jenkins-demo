pipeline {
    agent any
    environment{
        DOCKER_HUB_LOGIN = credentials('docker-hub-roxs')
        BRANCH_NAME = sh(returnStdout: true, script: "git rev-parse --abbrev-ref HEAD").trim()
        shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
    }
    stages{
         stage ('version'){
            steps{
                sh 'source ./version.sh'
                sh 'echo $VERSION'
                echo "Branch ${env.BRANCH_NAME}"
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
