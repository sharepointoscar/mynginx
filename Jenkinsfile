pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'eval $(docker-machine env default)'
        sh 'echo just set eval $(docker-machine env default)'
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
