pipeline {
  agent any
  stages {
    stage('Build NGINX Image') {
      steps {
        sh 'docker build -t sharepointoscar/mywebsite:test .'
      }
    }
  }
}