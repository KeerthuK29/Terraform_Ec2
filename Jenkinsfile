
pipeline {
environment {
         AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    

   agent  any
      
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("Terraform")
                        {
                           git branch:'main',url:'https://github.com/KeerthuK29/Terraform_Ec2.git'
                        }
                    }
                }
            }

        stage('Run') {
            steps {
                sh 'terraform init'
                sh 'terraform plan'
                sh 'terraform apply -auto-approve'
                 
               }
           }
       

    }

  }
