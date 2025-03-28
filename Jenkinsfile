pipeline {
    agent {label 'node1'}
    environment{
        FLASK_ARCHIVE_NAME="flask_${env.BUILD_TAG}.tar.gz"
        NODE_ARCHIVE_NAME="node_${env.BUILD_TAG}.tar.gz"
    }

    stages {
        stage('Build') {
            steps {
                script{
                    sh'''
                    cd flask_app
                    touch ${FLASK_ARCHIVE_NAME}
                    tar --exclude=${FLASK_ARCHIVE_NAME} -czvf ../${FLASK_ARCHIVE_NAME} .
                    '''
                }
                script{
                    sh'''
                    cd node_app
                    touch ${NODE_ARCHIVE_NAME}
                    tar --exclude=${NODE_ARCHIVE_NAME} -czvf ../${NODE_ARCHIVE_NAME} .
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