pipeline {
  agent any
  tools {
    maven 'maven-3.6.3' 
  }
  stages { 
        stage ('print') {
            steps {
                echo 'Hello World'
            }
        }
        stage ('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sumanthghanta/VecmathDemo.git']]])
            }
        }
        stage ('build') {
            steps{
                sh "mvn clean verify"
            }
        }
    }   
}
