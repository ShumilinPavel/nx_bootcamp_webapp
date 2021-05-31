pipeline {
    agent any
    options {
        skipDefaultCheckout()
    }
    environment {
        TOKEN = credentials('telegramToken')
        CHAT_ID = credentials('telegramChatId')
    }
    stages {
        stage('Build') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: "${BRANCH_NAME}"]], extensions: [[$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: false, recursiveSubmodules: true, reference: '', trackingSubmodules: false]], userRemoteConfigs: [[url: 'https://github.com/ShumilinPavel/nx_bootcamp_webapp']]])
                sh './scripts/build.sh'
            }
        }
        stage('Deploy') {
            steps {
                sh './scripts/run.sh'
            }
        }
        stage('Test') {
            steps {
                sh 'curl -fsS -o /dev/null localhost || echo -1'
            }
        }
    }
    post {
        always {
            sh "curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d text=\"Jenkins job: ${JOB_NAME}\nBuild status is ${currentBuild.currentResult}\nSee ${BUILD_URL}\""
        }
    }
}
