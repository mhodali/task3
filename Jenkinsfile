pipeline{
  agent any 
      environment {
        registry = "mhodali/task-3"
        dockerImage = ''
    }
    
    stages{
 stage("clone"){
        steps{
checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'task3', url: 'https://github.com/mhodali/task3.git']]])
        }}
      
      stage("build"){
        steps{
        script {
       def client = docker.build("my-image:${env.BUILD_ID}","-f ${env.WORKSPACE}/client/Dockerfile .")
        }}}


      
    }
  }
