pipeline {  
  agent any
  
  environment {
    imageName = 'localhost:32000/mynginx'
    registryCredentialSet = ''
    registryUri = 'http://206.189.121.148:32000'
    dockerInstance = ''
  } 
  
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
          docker.withRegistry(registryUri) {
            dockerInstance.push("${env.BUILD_NUMBER}")
            dockerInstance.push("latest")
          }
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
