pipeline {
  agent any

    stages { 
        stage ('git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sumanthghanta/VecmathDemo.git']]])
        }
        stage ('mvn install and clean') {
            steps{
                sh "mvn clean package"
                sh "mvn install"
            }
        }
        stage ('print') {
            step{
                echo "Hello"
            }
        }
        post {
            always {
                 echo 'Thanks for running the job'
            }
        }
    }
    }
}
    

      
