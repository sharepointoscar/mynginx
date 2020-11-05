pipeline {
  agent {
    kubernetes {
      // this label will be the prefix of the generated pod's name
      label 'jenkins-agent-my-app'
      yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    component: ci
spec:
  containers:
    - name: docker
      image: docker
      command:
        - cat
      tty: true
      volumeMounts:
        - mountPath: /var/run/docker.sock
          name: docker-sock
    - name: kubectl
      image: lachlanevenson/k8s-kubectl:v1.14.0 # use a version that matches your K8s version
      command:
        - cat
      tty: true
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
