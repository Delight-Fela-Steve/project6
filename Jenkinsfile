pipeline {
    agent {label 'node1'}
    environment{
        FLASK_ARCHIVE_NAME="flask_${env.BUILD_TAG}.tar.gz"
        NODE_ARCHIVE_NAME="node_${env.BUILD_TAG}.tar.gz"
        BUCKET_NAME="s3://project6-dm"
    }

    stages {
        stage('Build') {
            steps {
                script{
                    sh'''
                    cd flask_app

                    python3 -m venv venv

                    . venv/bin/activate

                    pip install -r requirements.txt

                    touch ${FLASK_ARCHIVE_NAME}

                    tar --exclude=${FLASK_ARCHIVE_NAME} -czvf ../${FLASK_ARCHIVE_NAME} .
                    '''
                }

                script{
                    sh'''
                    cd node_app

                    npm install

                    touch ${NODE_ARCHIVE_NAME}
                    
                    tar --exclude=${NODE_ARCHIVE_NAME} -czvf ../${NODE_ARCHIVE_NAME} .
                    '''
                }
            }
        }
        stage('Upload Artifact') {
            steps {
                sh '''
                aws s3 cp ${FLASK_ARCHIVE_NAME} ${BUCKET_NAME}

                aws s3 cp ${NODE_ARCHIVE_NAME} ${BUCKET_NAME}
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                cd deployment
                ansible-playbook -i aws_ec2.yml playbook.yml
                '''
            }
        }
    }
}