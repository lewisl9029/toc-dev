# Development Environment for Toc Messenger

## Environment Setup

The entire development environment for Toc is fully reproducible using the Vagrantfile and Dockerfile provided in this repository.

The provided Vagrant VM can be used to build the Docker container from scratch or pull the Docker container from DockerHub's automated builds. You can also choose to set up dependencies manually on your machine using the Dockerfile and Vagrantfile in this repository as reference.

Instructions for building the Docker container from scratch:

1. Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) (Or alternatively, VMWare Workstation or Hyper-V)
2. Clone this repository
3. Clone the source repository at [lewisl9029/toc](https://github.com/lewisl9029/toc)
4. Add an environment variable TOC_PATH pointing to the directory where the source repo is located
5. Open terminal and navigate to this repository
6. Start and provision the development VM and build the docker container:
  ```
  vagrant up
  ```

7. SSH into the development VM:
  ```
  vagrant ssh
  ```

8. You're now ready to develop!

There are several aliases provided in the Vagrant VM for quick access to common workflows (such as serving, building, running the docker container interactively, etc). See their implementations in [vagrant-provision.sh](vagrant-provision.sh).
