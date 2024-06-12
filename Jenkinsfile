pipeline {
    agent any
    stages {
        stage('Set Name build') {
            steps {
               script {
                    currentBuild.displayName = "Build Test"
                    currentBuild.description = "Test jenkins for build test."
                    echo "build success"
                }
            }
        }
        stage('Build') {
            steps {
                script {
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
