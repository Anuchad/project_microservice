pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    bat "git branch"
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
