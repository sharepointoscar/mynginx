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
    
    stage('Building Staging') {
      steps {
        container('argo-cd-tools') {
          sh "https://github.com/${GH_ORG}/argocd-previews.git"
          sh "cd argocd-previews"
          sh "cat preview.yaml \
              | kyml tmpl -e REPO -e ${APP_ID} -e ${BUILD_NUMBER} e ${HOSTNAME \
              | tee helm/templates/${APP_ID}.yaml"
          sh "git add ."
          sh "git commit -m ${APP_ID}"
          sh "git push"
        }

      }
    }
    
    stage('Sending Notification') {
      steps {


      }
    }

  }
  environment {
    registry = 'localhost:5000/mynginx'
    PR_ID = $BUILD_NUMBER

    REPO = mynginx

    APP_ID = pr-$REPO-$PR_ID

    HOSTNAME = $APP_ID.$INGRESS_HOST.xip.io
    
    GH_ORG = 'nexcollab-bot'
    
  }
}
