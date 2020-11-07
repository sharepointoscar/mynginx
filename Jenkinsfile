pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/nexcollab-bot/mynginx.git'
      }
    }

    stage('Building image') {
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }

      }
    }

    stage('Deploy Image') {
      steps {
        script {
          docker.withRegistry(registryUri) {
            dockerImage.push()
          }
        }

      }
    }

  }
  environment {
    registry = 'localhost:5000/mynginx'
    registryUri = ''
    registryCredential = ''
    dockerImage = ''
  }
}