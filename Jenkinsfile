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
        stage('init and plan'){
            steps{
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AWS-Credentials'
                ]]) {
                    sh 'terraform init'
                    sh 'terraform plan'
                }
            }
        }
        stage('apply'){
            steps{
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AWS-Credentials'
                ]]) {
                    input message: "Apply Changes?"
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Destroy') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AWS-Credentials'
                ]]) {
                    input message: "Destroy infrastructure?"
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
}