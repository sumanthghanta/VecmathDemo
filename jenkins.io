pipeline {
  agent{
  }
  stages {
    steps {
        echo "Hello"
    }
    stage ('git') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sumanthghanta/VecmathDemo.git']]])
      }
    stage ('Build') {
      steps {
        sh 'mvn clean package'
        sh 'mvn install'
      }
      steps {

      }
    }
  }
}
}
