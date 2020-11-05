pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building container image...'
        script {
          dockerInstance = docker.build(imageName)
        }

      }
    }

    stage('Publish') {
      steps {
        echo 'Publishing container image to the registry...'
        script {
          sh "docker push localhost:32000/mynginx:${BUILD_NUMBER}"
        }

      }
    }

    stage('Deploy') {
      steps {
        echo 'Sending deployment request to Kubernetes...'
      }
    }

  }
  environment {
    imageName = 'localhost:32000/mynginx'
    registryCredentialSet = ''
    registryUri = 'http://206.189.121.148:32000'
    dockerInstance = ''
  }
}