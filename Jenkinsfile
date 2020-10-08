pipeline{
        agent any
        stages{
            stage('Pull Git Repo '){
                steps{
                    sh "git pull https://github.com/krystal-simmonds/SFIA_2.git"
                }
            }
            stage('Install Docker'){
                steps{
                    sh ''' 
                    curl https://get.docker.com | sudo bash
                    sudo usermod -aG docker $(whoami)
                    '''
                }
            }
                
            stage('Install Docker-Compose'){
                steps{
                    sh ''' 
                    sudo apt install -y curl jq
                    # set which version to download (latest)
                    version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
                    # download to /usr/local/bin/docker-compose
                    sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                    # make the file executable
                    sudo chmod +x /usr/local/bin/docker-compose
                    '''
                }
            }
                
            stage('Spin up docker compose'){
                steps{
                withCredentials([string(credentialsId: 'DATABASE_URI', variable: 'DATABASE_URI'), string(credentialsId: 'TEST_DATABASE_URI', variable: 'TEST_DATABASE_URI'), string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'MYSQL_ROOT_PASSWORD'), string(credentialsId: 'DB_PASSWORD', variable: 'DB_PASSWORD')]){
                    sh '''
                    sudo -E MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} DATABASE_URI=${DATABASE_URI} DB_PASSWORD=${DB_PASSWORD} TEST_DATABASE_URI=${TEST_DATABASE_URI} docker-compose up -d
                    '''
                }
                }
            }
        }    
}
