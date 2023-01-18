pipeline {
    agent any
    environment{
        APP_NAME= 'app-demo'
        REGISTRY ='roxsross12'
        IMAGE_NAME='roxsross12/app-demo'
        DOCKER_HUB_LOGIN = credentials('docker-hub')
        EC2_INSTANCES= 'ec2-user@52.55.21.214'
    }
    stages{
        stage ('checkout github'){
            steps{
                checkout scm
            }
        }  
        stage ('install dependencia'){
             agent {
                docker {
                    image 'node:erbium-alpine'
                    args '-u root:root'
                }           
            }
            steps{
                sh 'npm install'
            }
        }
        stage ('build'){
            steps{
                sh 'docker build -t $APP_NAME .'
                sh 'docker images'
            }
        }
        stage('Read JSON') {
            steps {
                script {
                    def packageJson = readJSON file: 'package.json'
                    def packageVersion = packageJSON.version
                    echo "${packageJSONVersion}"
                 }
             }
        }
        stage ('tag version'){
            steps{
                sh 'docker tag $APP_NAME:latest $REGISTRY/$APP_NAME:latest'
                sh 'docker images'
            }
        }
        stage ('Push'){
            steps{
                sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
                sh 'docker push $IMAGE_NAME'
            }   
        }
        stage ('deploy'){
            steps{
                sh 'echo DEPLOY'
                sh ("sed -i -- 's/REGISTRY/$REGISTRY/g' docker-compose.yaml")
                sh ("sed -i -- 's/APP_NAME/$APP_NAME/g' docker-compose.yaml")
                sshagent(['ssh-ec2']) {
                 sh "scp -o StrictHostKeyChecking=no docker-compose.yaml ${EC2_INSTANCES}:/home/ec2-user"
                 sh "ssh ${EC2_INSTANCES} ls -lrt"
                 sh "ssh ${EC2_INSTANCES} docker-compose up -d"
                    
                }
            }   
        }
    }
}
