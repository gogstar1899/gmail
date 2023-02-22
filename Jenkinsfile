pipeline {
  agent any
  stages {
    stage('send_mail') {
      steps {
        sh 'ruby config.rb'
      }
    }
  }
}