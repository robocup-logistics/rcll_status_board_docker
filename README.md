# rcll_status_board_docker
This readme describes the installation and usage for the [Robo Cup Logistics League Status Board Visualization](https://github.com/ethflo/rcll_status_board) (rcllviz) in a docker environment.

## Prerequesites
To work with the dockerized rcll_status_board the following prerequesites are necessary:

### Docker
You can install Docker with the following commands.
```
$ sudo apt install docker.io
$ sudo usermod -a -G docker $USER
```

After adding the docker group you will have to logout and login, before the changes are applied.

### Git
If not already installed you need git to clone the package.
```
$ sudo apt-get install git
```

## Installation Process
Clone the repo and change to the directory.
```
$ git clone https://github.com/ethflo/rcll_status_board_docker.git
$ cd rcll_status_board_docker
```

The repo provides an aliases source file, to cover the complex docker commands. To use the alias commands you have to source the `rcllviz_aliases` file with the following command. Each time you open a new terminal, where you want to use the commands you have to reenter this command.
```
$ source rcllviz_aliases
```

## Usage of the docker container
After sourcing the `rcllviz_aliases` file the following commands are available:
```
$ rcllviz-build
$ rcllviz-init
$ rcllviz-start
$ rcllviz-stop
```
- The `rcllviz-build` command builds the docker image from the Dockerfile. As the resulting container is quite big with the current setup (about 2GB), no dockerimage is currently provided at DockerHub. For _llsf_msgs_ and _rcll_status_board_ the branch **dockerized** will be used.
- The `rcllviz-init` command initializes the docker container with four parameters and runs it. If it is necessary to change the parameters you have to do this before by modifying the aliases file, resource it and run the `rcllviz-init` command. The container stays existent after quitting it with Ctrl+C.
  - `--refbox_host 192.168.2.108` IP adress of the refbox computer.
  - `--refbox_remote true` Defines whether the refbox is on a remote computer or not. If the value is `false` the `refbox_host` parameter is ignored and `localhost` is used as value for this.
  - `--screen_x 1920` Screen resolution width in pixel. The visualization is optimized for a screen with 1920x1080 pixels. Other resolutions might also work.
  - `--screen_y 1080` Screen resolution height in pixel. The visualization is optimized for a screen with 1920x1080 pixels. Other resolutions might also work.
- The `rcllviz-reset` command removes the currently used docker container and a new one has to be initialized with `rcllviz-init`.
- The `rcllviz-start` command starts the previously initialized container. Ctrl-C will leave the docker container, but not stop it.
- The `rcllviz-stop` command will stop a started docker container. The container stays existent and can be restarted with `rcllvit-start`.
- The `rcllviz-run` command initializes ans runs the docker container with the same four parameters as `rcllviz-init`. In difference quitting with Ctrl+C stops the container and removes it. It has to be reinitialized to be used again.
- The `rcllviz-console` opens a bash terminal to a started container if it should ever be necessary to enter the container.

## Usage of the rcll_viz_status_board
Pressing F in the status board window changes to full screen mode. Pressing ESC leaves the full screen mode.

