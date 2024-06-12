def remote = [:]
  remote.name = 'root'
  remote.host = '165.22.246.53'
  remote.user = 'root'
  remote.password = 'P7As6E44qFWCgLX'
  remote.allowAnyHosts = true

pipeline {
    agent any
    stages {
        stage('Set Name build') {
            steps {
               script {
                    currentBuild.displayName = "Build Test"
                    currentBuild.description = "Test jenkins for build test."
                    echo "setname success"
                }
            }
        }
        stage('Remote SSH') {
            steps {
                script {
                    echo "remote ...."
                }
                sshCommand remote: remote, command: "cd /var"
                sshCommand remote: remote, command: "node -v"
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
