pipeline {
  agent any
  stages {
    stage('version') {
      steps {
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