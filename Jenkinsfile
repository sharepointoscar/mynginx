pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }
    
  }
  stages {
    stage('Build') {
      steps {
        sh 'eval $(docker-machine env)'
        sh 'echo just set eval $(docker-machine env default)'
        sh 'sudo docker version'
      }
    }
    stage('Login to Docker Hub') {
      steps {
        sh 'echo executing Login to Docker Hub Step'
      }
    }
    stage('Push image to Docker Hub') {
      steps {
        sh 'echo executing Push Image to Docker Hub Step'
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