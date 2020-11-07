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
          dockerImage = docker.build registry + ":v$BUILD_NUMBER"
        }

      }
    }

    stage('Deploy Image') {
      steps {
        script {
          dockerImage.push("v$BUILD_NUMBER")
        }

      }
    }

  }
  environment {
    registry = 'localhost:5000/mynginx'
    registryUri = 'http://165.232.98.105:5000/v2'
    registryCredential = ''
    dockerImage = ''
  }
}
