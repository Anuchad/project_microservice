def remote = [:]
  remote.name = 'root'
  remote.host = '165.22.246.53'
  remote.allowAnyHosts = true

def CONNECT(remote, env, command) {
    echo "Remote to server ${remote.host}"
  
    // Setup Username And Password For SSH
    remote.user=env.REMOTE_CREDS_USR
    remote.password=env.REMOTE_CREDS_PSW

    // SSH Command
    sshCommand remote: remote, command: "${command}"
    //sshCommand remote: remote, command: "git clone ${env.GIT_REPO}"
}

pipeline {
    agent any
    parameters {
        choice(name: 'COMMAND', choices: ['Setup', 'Git Pull', 'Test'], description: 'Select Command')
    }
    environment {
      REMOTE_CREDS = credentials('remote-ssh')
      GIT_REPO = "${env.GIT_URL}"
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
                expression {params.COMMAND == 'Setup'}
              }
            }
            input {
                message "Setup Directoty Name"
                ok "Yes, we should."
                submitter "alice,bob"
                parameters {
                    string(name: 'PROJECT_NAME', defaultValue: '', description: 'Directoty Name')
                }
            }
            agent { dockerfile true}
            steps {
                script {
                    if(params.PROJECT_NAME != "") {
                      env.GIT_REPO = "${env.GITREPO} ${params.PROJECT_NAME}"
                    }

                    sh "mkdir test"
                    dir ('test) {
                        sh '''
                            git clone ${env.GIT_REPO}
                            ls -l
                        '''
                    }
                    //CONNECT(remote, env, "cd /var/www/html && git clone ${env.GIT_REPO}")

                    echo "Clone Git Success"
                }
            }
        }
        stage('Git Pull') {
            when {
                anyOf {
                  expression {params.COMMAND == 'Git Pull'}
                }
            }
            steps {
                script {
                    CONNECT(remote, env, "cd /var/www/html/project_microservice && git pull")
                    echo "Git Pull Success"
                }
            }
        }
        stage('Test Build') {
            when {
                anyOf {
                  expression {params.COMMAND == 'Test'}
                }
            }
            steps {
                script {
                    echo "Test Build Success"
                    // sh '''
                    //   apt install nodejs
                    //   node --version
                    //   git --version
                    //   curl --version
                    // '''
                    //sh 'make build'
                }
            }
        }
    }
}
