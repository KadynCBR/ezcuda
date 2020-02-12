echo "Passwordless sudo needs to be activated..."

echo "*************************"
echo "Remove previous docker installations"
echo "*************************"
sudo apt remove docker docker-engine docker.io

echo "*************************"
echo "Install things required for docker repo"
echo "*************************"
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

echo "*************************"
echo "Add Dockers GPG Key"
echo "*************************"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

echo "*************************"
echo "Add docker apt repo"
echo "*************************"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "*************************"
echo "update apt and install docker-ce (19.03 +)"
echo "*************************"
sudo apt update
sudo apt install -y docker-ce

echo "*************************"
echo "Adding user to docker group. "
echo "*************************"
sudo usermod -aG docker $USER

echo "*************************"
echo "Now installing nvidia Docker"
echo "*************************"
echo "*************************"
echo "Adding nvidia docker GPG and apt."
echo "*************************"
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list


echo "Installing nvidia-container toolkit and restarting docker."
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker


echo "*************************"
echo "Hopefully this worked ._ . Remember to logout and log back in."
echo "*************************"
