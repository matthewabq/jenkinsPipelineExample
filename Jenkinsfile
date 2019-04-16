pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'docker build -t matt/node .'
            }
        }
        stage('Test') {
            steps {
                echo 'docker images | grep node'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
