pipeline {
    agent any
    environment {
        IMAGE_NAME = 'matt/node'
        TARGET_CONTAINER = "${IMAGE_NAME}"
        BUILD_TAG = "latest"
    }

    stages {
        stage('Build') {
            steps {
                echo "docker build -t $IMAGE_NAME:$BUILD_TAG ."
            }
        }
        stage('twistlock scan') {
            steps {
                sh 'echo try this'
                sh 'docker images | grep matt | grep node'
                sh "docker build -t $IMAGE_NAME:$BUILD_TAG ."
                sh 'docker images | grep matt | grep node'
                twistlockScan ca: '',
                        cert: '',
                        policy: 'warn',
                        compliancePolicy: 'warn',
                        containerized: false,
                        dockerAddress: 'unix:///var/run/docker.sock',
                        gracePeriodDays: 0,
                        ignoreImageBuildTime: true,
                        key: '',
                        logLevel: 'true',
                        requirePackageUpdate: false,
                        timeout: 10,
                        repository: "${TARGET_CONTAINER}",
                        tag: "${BUILD_TAG}",
                        image: "${TARGET_CONTAINER}:${BUILD_TAG}" || error=true
            }
        }
        stage('twistlock publish') {
            steps {
                twistlockPublish ca: '',
                        cert: '',
                        dockerAddress: 'unix:///var/run/docker.sock',
                        ignoreImageBuildTime: true,
                        key: '',
                        logLevel: 'true',                        
                        timeout: 10,
                        repository: "${TARGET_CONTAINER}",
                        tag: "${BUILD_TAG}",
                        image: "${TARGET_CONTAINER}:${BUILD_TAG}"
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
