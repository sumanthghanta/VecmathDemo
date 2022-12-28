pipeline {
  agent any{
    stages { 
        stage ('git') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sumanthghanta/VecmathDemo.git']]])
            }
            steps {
                sh 'mvn clean package'
                 sh 'mvn install'
                 }
            steps{
                     sh 'echo "${Hello}"
                 }
        }
      }
    }
  }
