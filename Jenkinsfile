pipeline {
    agent any
    
    parameters {
        string(
            name: 'GIT_TAG',
            defaultValue: 'v5.0.0',
            description: 'Enter the GitHub tag to build (e.g., v5.0.0, v4.0.0)'
        )
    }
    
    stages {
        stage('Set Build Name') {
            steps {
                script {
                    // This makes the tag appear instead of build number
                    currentBuild.displayName = "#${BUILD_NUMBER} - ${params.GIT_TAG}"
                    currentBuild.description = "Built from tag: ${params.GIT_TAG}"
                }
            }
        }
        
        stage('Checkout') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: "refs/tags/${params.GIT_TAG}"]],
                    userRemoteConfigs: [[
                        url: 'https://github.com/muthoju-lotuswave/my-repo.git'
                    ]]
                ])
            }
        }
        
        stage('Run System Check') {
            steps {
                sh 'chmod +x check.sh'
                sh './check.sh'
            }
        }
    }
    
    post {
        always {
            echo "Build completed for tag: ${params.GIT_TAG}"
        }
    }
}
