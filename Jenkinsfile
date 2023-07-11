pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
               sh 'ls -lrt'
            }
        }
        stage('docker') {
            steps {
               sh 'docker info'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
