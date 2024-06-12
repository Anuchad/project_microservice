def remote = [:]
  remote.name = 'root'
  remote.host = '165.22.246.53'
  remote.user = 'root'
  remote.password = 'P7As6E44qFWCgLX'
  remote.allowAnyHosts = true

pipeline {
    agent any
    parameters {
        choice(name: 'CHOICE', choices: ['git version', 'git status', 'git pull'], description: 'Select action')
    }
    environment {
      REMOTE_CREDS = credentials('remote-ssh')
    }
    stages {
        stage('Set Name build') {
            steps {
               script {
                    currentBuild.displayName = "Build Test"
                    currentBuild.description = "Test jenkins for build test. action = ${params.CHOICE}"
                    echo "setname success"
                    echo "===================="
                    echo "${env.REMOTE_CREDS}"
                    echo "===================="
                    sh "printenv | sort"
                }
            }
        }
        stage('Remote SSH') {
            when {
              anyOf {
                expression {params.CHOICE == 'git version'}
              }
            }
            steps {
                script {
                    echo "remote ...."
                    remote.user=env.REMOTE_CREDS_USR
                    remote.password=env.REMOTE_CREDS_PSW
                }
                sshCommand remote: remote, command: "cd /var"
                sshCommand remote: remote, command: "node -v"
            }
        }
        stage('Build') {
          when {
              anyOf {
                expression {params.CHOICE == 'git pull'}
              }
            }
            steps {
                script {
                    echo "build success"
                }
            }
        }
        stage('Scane') {
          when {
              anyOf {
                expression {params.CHOICE == 'git status'}
              }
            }
            steps {
                script {
                    echo "scane success"
                }
            }
        }
    }
}
