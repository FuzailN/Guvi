pipeline {
    agent any 
    
    stages {
        stage("Clone Code") {
            steps {
                echo "Cloning the code"
                git url: "https://github.com/FuzailN/Guvi.git", branch: "main"
            }
        }
        stage("Build") {
            steps {
                echo "Building the image"
                sh "docker build -t guvi-geek ."
            }
        }
        stage("Push to Docker Hub") {
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]) {
                    sh "docker tag guvi-geek ${env.dockerHubUser}/guvi-geek:latest"
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker push ${env.dockerHubUser}/guvi-geek:latest"
                }
            }
        }
        stage("Remove Previous Container") {
            steps {
                echo "Removing previous container"
                script {
                    try {
                        sh 'docker rm -f guvigeek'
                    } catch (Exception e) {
                        // Do nothing if there is an exception
                    }
                }
            }
        }
        stage("Deploy") {
            steps {
                echo "Deploying the container"
                sh 'docker run -d -p 80:5000 --name guvigeek imfuzail/guvi-geek:latest'
            }
        }
    }
}
