pipeline {
  agent any
  stages {
    stage('Build NGINX Image') {
      steps {
        sh 'sudo docker build -t sharepointoscar/mywebsite:test .'
      }
    }
    stage('Push Image to Docker Hub') {
      steps {
        sh 'sudo docker push sharepointoscar/mywebsite:test'
      }
    }
  }
}