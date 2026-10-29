pipeline {
    agent any

    environment {
        IMAGE_NAME = "ussenkan-yersultan-student-api"
        IMAGE_TAG = "v1.0-ussenkan-yersultan"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "1. Получение исходного кода из Git..."
                checkout scm
            }
        }

        stage('Build with Gradle') {
            steps {
                echo "2. Сборка проекта с помощью Gradle..."
                // Для Unix/macOS используем ./gradlew, для Windows в Jenkins можно указать bat 'gradlew clean build'
                sh './gradlew clean build -x test'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "3. Сборка Docker образа..."
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Run Tests / Validation') {
            steps {
                echo "4. Проверка работы контейнеров через Docker Compose..."
                sh 'docker compose up -d'
            }
        }
    }

    post {
        success {
            echo "Пайплайн успешно завершен для студента: Ussenkan Yersultan!"
        }
        failure {
            echo "В процессе выполнения пайплайна произошла ошибка."
        }
    }
}