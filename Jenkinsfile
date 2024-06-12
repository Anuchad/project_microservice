pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    bat "npm -v"
                    echo "build success"
                }
            }
        }
        stage('Scane') {
            steps {
                script {
                    echo "scane success"
                }
            }
        }
    }
}
