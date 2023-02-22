pipeline {
  agent none
  stages {
    stage('Ruby Install') {
        agent {
            docker {
                image 'gmail'
                }
            }
        }
    }
        }
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