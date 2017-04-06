pipeline {
  agent any
  stages {
    stage('Build NGINX Image') {
      steps {
        sh 'sudo docker build -t sharepointoscar/mywebsite:test .'
      }
    }
  }
}