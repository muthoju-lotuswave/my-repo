pipeline {
    agent any

    // Only run this pipeline when triggered by a tag matching v*
    triggers {
        githubPush()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo "Running build for tag: ${env.GIT_TAG_NAME ?: env.TAG_NAME ?: 'unknown'}"
            }
        }

        stage('Memory Info') {
            steps {
                sh 'free -h'
            }
        }

        stage('Process Info') {
            steps {
                sh 'ps aux'
                sh 'ps -ef'
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully for tag: ${env.GIT_TAG_NAME ?: env.TAG_NAME}"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
