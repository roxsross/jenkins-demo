pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
               sh 'ls -lrt'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
