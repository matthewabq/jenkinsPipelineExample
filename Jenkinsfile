pipeline {
    agent any
    environment {
        IMAGE_NAME = 'matt/node'
        TARGET_CONTAINER = "${IMAGE_NAME}"
        BUILD_TAG = "1"
    }

    stages {
        stage('Build') {
            steps {
                echo "docker build -t $IMAGE_NAME:$BUILD_TAG ."
            }
        }
        stage('twistlock scan') {
            steps {
                sh 'docker images'
                twistlockScan ca: '',
                        cert: '',
                        compliancePolicy: 'warn',
                        containerized: false,
                        dockerAddress: 'unix:///var/run/docker.sock',
                        gracePeriodDays: 0,
                        ignoreImageBuildTime: true,
                        key: '',
                        logLevel: 'true',
                        policy: 'warn',
                        requirePackageUpdate: false,
                        timeout: 10,
                        repository: "${TARGET_CONTAINER}",
                        tag: "${BUILD_TAG}",
                        image: "${TARGET_CONTAINER}:${BUILD_TAG}"
            }
        }
        stage('twistlock publish') {
            steps {
                twistlockPublish ca: '',
                        cert: '',
                        dockerAddress: 'unix:///var/run/docker.sock',
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
