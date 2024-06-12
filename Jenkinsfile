def remote = [:]
  remote.name = 'root'
  remote.host = '165.22.246.53'
  remote.user = 'root'
  remote.password = 'P7As6E44qFWCgLX'
  remote.allowAnyHosts = true

pipeline {
    agent any
    parameters {
        choice(name: 'COMMAND', choices: ['Setup', 'git pull'], description: 'Select Command')
    }
    environment {
      REMOTE_CREDS = credentials('remote-ssh')
      GIT_REPO = env.GIT_URL
    }
    stages {
        stage('Set Name build') {
            steps {
               script {
                    currentBuild.displayName = "Build Test ${env.BUILD_ID}"
                    currentBuild.description = "Test jenkins for build test. action = ${params.CHOICE}"
                    echo "Setname Success"
                    echo "===================="
                    echo "${env.GIT_BRANCH}"
                    echo "===================="
                    //sh "printenv | sort"
                }
            }
        }
        stage('Setup Project') {
            when {
              anyOf {
                expression {params.COMMAND == 'git version'}
              }
            }
            steps {
                script {
                    echo "Remote to server ${remote.host}"

                    parameters {
                        string(name: 'PROJECT_NAME', defaultValue: 'Mr Jenkins', description: 'Project Name')
                    }

                    if(params.PROJECT_NAME != "") {
                      env.GIT_REPO = "${env.GITREPO} ${params.PROJECT_NAME}"
                    }
                    // Setup Username And Password For SSH
                    remote.user=env.REMOTE_CREDS_USR
                    remote.password=env.REMOTE_CREDS_PSW

                    // SSH Command
                    sshCommand remote: remote, command: "cd /var/www/html"
                    sshCommand remote: remote, command: "git clone ${env.GIT_REPO}"

                    echo "Clone Git Success"
                }
            }
        }
    }
}
