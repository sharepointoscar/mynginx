pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }
    
  }
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
    stage('Push image to Docker Hub') {
      steps {
        sh 'sudo docker push sharepointoscar/mywebsite:test'
      }
    }
  }
}