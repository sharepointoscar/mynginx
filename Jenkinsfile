pipeline {
  environment {
    registry = ""
    registryUri = 'http://165.232.98.105:5000'
    registryCredential = ''
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/nexcollab-bot/mynginx.git'
      }
    }
    stage('Building image') {
      steps {
        container('docker') {
            dir ('src') {
                sh "docker build -t localhost:5000/mynginx:v$BUILD_NUMBER ."
            }
        }
      }

    }

    stage('Deploy Image') {
      steps {
        container('docker') {
            dir ('src') {
                sh "docker push localhost:5000/mynginx:v$BUILD_NUMBER"
            }
        }
      }
    }
  }
}
