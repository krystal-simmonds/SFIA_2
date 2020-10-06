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
                    sh ''' 
                    sudo docker-compose up -d
                    '''
                }
            }
        }    
}
