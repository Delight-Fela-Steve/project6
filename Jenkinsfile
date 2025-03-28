pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh'''
                ls
                '''
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