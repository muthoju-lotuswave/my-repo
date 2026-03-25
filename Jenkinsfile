pipeline {
    agent any

    parameters {
        string(name: 'TAG', defaultValue: '', description: 'Release tag to build')
    }

    stages {
        stage('Init') {
            steps {
                script {
                    if (!params.TAG) {
                        error "Please provide a TAG parameter!"
                    }
                    currentBuild.displayName = params.TAG
                    currentBuild.description = "Release: ${params.TAG}"
                    echo "Build tagged as: ${params.TAG}"
                }
            }
        }

        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM',
                          branches: [[name: "refs/tags/${params.TAG}"]],
                          doGenerateSubmoduleConfigurations: false,
                          extensions: [[$class: 'CloneOption', noTags: false, reference: '', shallow: false]],
                          userRemoteConfigs: [[url: 'https://github.com/muthoju-lotuswave/my-repo.git']]])
                sh 'git fetch --tags'
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
            echo "Pipeline completed successfully for tag: ${params.TAG}"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
