# Development Environment for Toc Messenger

## Environment Setup

You may choose to either directly use the provided Vagrantfile and Dockerfile to reproduce my development environment, or use them as reference to set up the development dependencies in your own environment.

Instructions for the former option:

1. Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) (Or alternatively, VMWare Workstation or Hyper-V)
2. Clone this repository
3. Clone the source repository at [lewisl9029/toc](https://github.com/lewisl9029/toc)
4. Add an environment variable TOC_PATH pointing to the directory where the source repo is located
5. Open terminal and navigate to this repository
6. Start and provision the development VM with docker installed:
  ```
  vagrant up
  ```

7. SSH into the development VM:
  ```
  vagrant ssh
  ```

8. You're now ready to develop!

There are several aliases provided in the Vagrant VM for quick access to common workflows (such as serving, building, running the docker container interactively, etc). See their implementations in [vagrant-provision.sh](vagrant-provision.sh).
