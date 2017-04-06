pipeline {
  agent any
  stages {
    stage('Build NGINX Image') {
      steps {
        sh 'sudo docker build -t sharepointoscar/mywebsite:test .'
      }
    }
    stage('Login to Docker Hub') {
      steps {
        sh 'sudo docker login --username sharepointoscar --password theace01!'
      }
    }
  }
}