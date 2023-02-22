pipeline {
  agent any
  stages {
    stage('version') {
      steps {
        sh 'rbenv install 3.1.3'
        sh 'rbenv local 3.1.3'
        sh 'ruby --version'
      }
    }
    stage('send_mail') {
      steps {
        sh 'ruby config.rb'
      }
    }
  }
}