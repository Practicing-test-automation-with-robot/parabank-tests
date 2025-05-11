pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Practicing-test-automation-with-robot/parabank-tests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t parabank-tests .'
            }
        }

        stage('Run Tests in Docker') {
            steps {
                sh 'docker run --rm parabank-tests'
            }
        }

        stage('Publish Report') {
            steps {
                publishHTML([reportDir: '.', reportFiles: 'report.html', reportName: 'Test Report'])
            }
        }
    }
}
