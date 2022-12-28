pipeline {
  agent any
  
  stages { 
        stage ('print') {
            steps {
                echo 'Hello World'
            }
        }
        stage ('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/sumanth']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/amitvermaa93/jenkins-git-integration.git']]])
            }
        }
        stage ('build') {
            steps{
                sh 'mvn clean verify'
                sh 'mvn install'
            }
        }
    }   
    post {
            always {
                 echo 'Thanks for running the job'
            }
        }
}
