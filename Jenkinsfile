pipeline{
    agent any;

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id') 
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    stages{
        stage('clone'){
            steps{
                git branch: 'main', url: 'https://github.com/lalit192977/terraform-cross-region-vpc-peering.git'
            }
        }
        stage('init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('plan'){
            steps{
                sh 'terraform plan'
            }
        }
        stage('apply'){
            steps{
                input message: "Apply Changes?"
                sh 'terraform apply --auto-approve'
            }
        }
        stage('Destroy') {
            steps {
                input message: "Destroy infrastructure?"
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}