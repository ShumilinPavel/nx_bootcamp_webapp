pipeline {
    agent any
    
    options {
        skipDefaultCheckout()
    }
    
    stages {
        stage('Build') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/develop']], extensions: [[$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: false, recursiveSubmodules: true, reference: '', trackingSubmodules: false]], userRemoteConfigs: [[url: 'https://github.com/ShumilinPavel/nx_bootcamp_webapp']]])
                sh './scripts/build.sh'
            }
        }
        
        stage('Deploy') {
            steps {
                sh './scripts/run.sh'
            }
        }
    }
}
