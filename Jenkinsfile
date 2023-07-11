pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
               sh 'kubectl apply -f pod.yaml'
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
