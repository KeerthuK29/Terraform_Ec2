
pipeline {

    parameters {
        string(name: 'environment', defaultValue: 'terraform_demo1', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')

    }


     environment {
         AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }
    

   agent  any
      
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                           git branch:'main',url:'https://github.com/KeerthuK29/Terraform_Ec2.git'
                        }
                    }
                }
            }

        stage('Plan') {
            steps {
                sh 'terraform init -input=false'
                sh 'terraform workspace new ${environment}'
                sh ' terraform workspace select ${environment}'
                sh 'terraform plan -input=false -out tfplan '
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                sh " terraform apply -input=false tfplan"
            }
        }
    }

  }
