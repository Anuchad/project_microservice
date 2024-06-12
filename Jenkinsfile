pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    currentBuild.displayName = "The name."
                    currentBuild.description = "The best description."
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
