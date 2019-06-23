# rcll_status_board_docker
Dockerfile for complete rcll_status_board environment

sudo apt install docker.io
sudo apt-get install git
sudo usermod -a -G docker $USER

logout login
cd rcll_status_board_docker
source rcllviz_aliases

rcllviz-build
rcllviz-init
rcllviz-startut
Ctrl-C will leave the docker container, but not stop it.
Re-Entering or entering with a shell is possible with rcllviz-console
rcllviz-stop will stop the docker container
