pipeline {
    agent any
    stages {
        stage("Clean up"){
            steps {
                deleteDir()
            }
        }
        stage("Clone Repo"){
            steps {
                sh "git clone https://github.com/gogstar1899/gmail.git"
            }
        }
        stage("Build"){
          steps {
              dir("gmail") {
               sh "gem install bundler"
               sh "bundle install"
               sh "ruby config.rb"
              }
          }
        }
    }
}