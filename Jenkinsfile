pipeline {
    agent any

    stages {
        
        stage('Clone Repository') {
            steps {
                         echo 'Cloning git repository'
                        retry(2) {    
                        checkout([
                            $class: 'GitSCM', 
                            branches: [[name: '**']], 
                            doGenerateSubmoduleConfigurations: false, 
                            extensions: [
                                [$class: 'CheckoutOption', timeout: 60], 
                                [$class: 'CloneOption', depth: 100, noTags: false, reference: '', shallow: false, timeout: 60],
                                ], 
                                submoduleCfg: [], 
                                userRemoteConfigs: [[name: 'origin', refspec: '+refs/pull/*:refs/remotes/origin/pr/*', url: 'https://github.com/Nithinhpe/pipeline-project.git']]
                            ])       
                        }
                        echo 'Cloning done'
                    }

        }

        stage('Build') {
            steps {
                echo "Building"
                echo "$WORKSPACE"
                sh 'chmod +x $WORKSPACE'
                sh '''
                    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh

                '''
            }
        }

        stage('Test') {
            steps {
                echo "Testing"
                 sh './jenkins/test/mvn.sh mvn test'
            }
        }


        stage('Push') {
            steps {
                echo 'Pushing'
                 sh './jenkins/push/push.sh'  
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploy'
                 sh './jenkins/deploy/deploy.sh'
            }
        }
    }
     post {
        // Clean after build
        always {
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
                              [pattern: '.propsfile', type: 'EXCLUDE']])
        }
    }
}