pipeline {
  agent {
    kubernetes {
      label 'jenkins-docker-network'
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
labels:
  component: ci
spec:
  # Use service account that can deploy to all namespaces
  serviceAccountName: cd-jenkins
  containers:
  - name: docker
    image: docker:latest
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: docker-sock
  volumes:
    - name: docker-sock
      hostPath:
        path: /var/run/docker.sock
"""
}
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
  environment {
    imageName = 'localhost:32000/mynginx'
    registryCredentialSet = ''
    registryUri = 'http://206.189.121.148:32000'
    dockerInstance = ''
  }
}
