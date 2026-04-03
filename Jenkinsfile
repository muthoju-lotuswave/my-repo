pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run System Check') {
            steps {
                sh 'chmod +x check.sh'
                sh './check.sh'
            }
        }
    }
}
