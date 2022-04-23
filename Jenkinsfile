pipeline {
    agent any
    environment{
        NOMBRE='rossana'
        APELLIDO= 'suarez'
        APP_NAME= 'app-demo'
    }
    stages{
        stage ('checkout github'){
            steps{
                checkout scm
            }
        }  
        stage ('install dependencia'){
            steps{
                sh 'npm install'
            }
        }
        stage ('test'){
            steps{
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                sh 'npm run test'
            }
            }
        }
        stage ('build'){
            steps{
                sh 'docker build -t $APP_NAME .'
                sh 'docker images'
            }
        }
    }
}