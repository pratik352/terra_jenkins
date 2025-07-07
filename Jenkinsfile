pipeline {
    agent any

    environment {
        ARM_CLIENT_ID        = credentials('azure-client-id')
        ARM_CLIENT_SECRET    = credentials('azure-client-secret')
        ARM_SUBSCRIPTION_ID = credentials('azure-subscription-id')
        ARM_TENANT_ID        = credentials('azure-tenant-id')

        TF_VAR_location      = 'East US'
        TF_LOG               = 'ERROR'  
    }

    stages {
        stage('Clone Terraform Repo') {
            steps {
                git url: 'https://github.com/pratik352/terra_jenkins.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                terraform init 
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Approve infrastructure deployment?'
                sh 'terraform apply tfplan'
            }
        }
    }

    post {
        failure {
            echo 'Terraform pipeline failed '
        }
        success {
            echo 'Terraform pipeline completed successfully'
        }
    }
}
