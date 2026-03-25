pipeline {
    agent any

    // Manual input parameter for the tag
    parameters {
        string(name: 'TAG', defaultValue: '', description: 'Enter the release tag to build, e.g., v3.0.0')
    }

    stages {
        stage('Init') {
            steps {
                script {
                    // Validate TAG parameter
                    if (!params.TAG?.trim()) {
                        error "Please provide a TAG parameter!"
                    }

                    // Set build display name and description
                    currentBuild.displayName = params.TAG
                    currentBuild.description = "Release: ${params.TAG}"
                    echo "Preparing build for tag: ${params.TAG}"
                }
            }
        }

        stage('Checkout') {
            steps {
                script {
                    // Fetch all tags first
                    sh 'git fetch --tags'

                    // Checkout the specific tag
                    checkout([$class: 'GitSCM',
                              branches: [[name: "refs/tags/${params.TAG}"]],
                              doGenerateSubmoduleConfigurations: false,
                              userRemoteConfigs: [[url: 'https://github.com/muthoju-lotuswave/my-repo.git']]])
                    echo "Checked out tag: ${params.TAG}"
                }
            }
        }

        stage('Memory Info') {
            steps {
                echo "Displaying system memory info..."
                sh 'free -h'
            }
        }

        stage('Process Info') {
            steps {
                echo "Displaying running processes..."
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
            echo "Pipeline failed for tag: ${params.TAG}"
        }
    }
}
