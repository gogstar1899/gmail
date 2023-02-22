pipeline {
  agent any
  stages {
    stage('send_mail') {
      steps {
        sh 'docker run -it gmail'
      }
    }
  }
}