pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {

        stage('Init') {
            steps {
                script {
                    def tag = env.GIT_TAG_NAME ?: env.TAG_NAME ?: "no-tag"
                    currentBuild.displayName = "${tag}"
                    currentBuild.description = "Release: ${tag}"
                    echo "Build tagged as: ${tag}"
                }
            }
        }

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
