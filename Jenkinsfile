pipeline {
  agent any
  stages {
    stage('Build Init') {
      parallel {
        stage('Build Init') {
          steps {
            echo 'Build Init'
          }
        }

        stage('Workspace Init') {
          steps {
            echo 'Workspace Init'
          }
        }

      }
    }

    stage('Build Process') {
      steps {
        echo 'Build Process'
        sh 'sh build.sh'
      }
    }

    stage('Post-Build') {
      steps {
        echo 'Post-Build'
      }
    }

    stage('Artifacts') {
      steps {
        echo 'Artifacts'
      }
    }

  }
}