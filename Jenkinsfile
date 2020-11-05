pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building container image...'
        container('docker') {
          sh "docker build -t localhost:32000/mynginx:${env.BUILD_NUMBER} ."
        }
      }
    }

    stage('Publish') {
      steps {
        echo 'Publishing container image to the registry...'
        container('docker') {
          sh "docker push localhost:32000/mynginx:${env.BUILD_NUMBER}"
        }

      }
    }

    stage('Deploy') {
      steps {
        echo 'Sending deployment request to Kubernetes...'
      }
    }

  }
}
