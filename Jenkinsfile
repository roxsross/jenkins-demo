pipeline {
  agent {
    node {
      label 'go'
    }
  }

    stages {
        stage('Build') {
            steps {
               sh 'ls -lrt'
            }
        }
    stage('build & push snapshot') {
      steps {
        container('go') {
          sh 'docker info'
          }
        }

      }
    }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
