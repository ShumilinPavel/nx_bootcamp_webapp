pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'git clone --recurse-submodules https://github.com/ShumilinPavel/nx_bootcamp_webapp'
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
