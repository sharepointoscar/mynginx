pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'eval $(docker-machine env default)'
        sh 'echo just set eval $(docker-machine env default)'
        sh '''sudo docker version
sudo docker build -t sharepointoscar/mywebsite:test .'''
      }
    }
    stage('Login & Push Image to Docker Hub') {
      steps {
        sh '''echo executing Login to Docker Hub Step
withCredentials([usernamePassword(credentialsId: 'dockerhubCreds', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
    sh docker login --username DOCKERHUB_USERNAME --password DOCKERHUB_PASSWORD
    sh docker push sharepointoscar/mywebsite:test
}


'''
      }
    }
  }
  post {
    always {
      echo 'This will always run'
      
    }
    
    success {
      echo 'This will run only if successful'
      
    }
    
    failure {
      echo 'This will run only if failed'
      
    }
    
    unstable {
      echo 'This will run only if the run was marked as unstable'
      
    }
    
    changed {
      echo 'This will run only if the state of the Pipeline has changed'
      echo 'For example, if the Pipeline was previously failing but is now successful'
      
    }
    
  }
}