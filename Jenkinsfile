pipeline {
    agent {label 'node1'}
    environment{
        FLASK_ARCHIVE_NAME="flask_${env.BUILD_TAG}.tar.gz"
        NODE_ARCHIVE_NAME="flask_${env.BUILD_TAG}.tar.gz"
    }

    stages {
        stage('Build') {
            steps {
                script{
                    sh'''
                    touch ${FLASK_ARCHIVE_NAME}
                    tar --exclude=${FLASK_ARCHIVE_NAME} -czvf ${FLASK_ARCHIVE_NAME} flask_app/*
                    touch ${NODE_ARCHIVE_NAME}
                    tar --exclude=${NODE_ARCHIVE_NAME} -czvf ${NODE_ARCHIVE_NAME} node_app/*
                    '''
                }
            }
        }
        stage('Upload Artifact') {
            steps {
                echo 'Uploading Artifacts..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}