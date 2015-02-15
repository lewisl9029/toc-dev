# Dev Environment for Toc Messenger

## Environment Setup

1. Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/)
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

## Working with Vagrant and Docker

Read up on [Docker](https://www.docker.com/) if you're not already familiar with it. The project makes heavy use of docker containers to build declarative, reproducible development environments.

You can edit files, make commits, push your branches on your local OS as you normally do.

Changes will be reflected in the VM and docker container immediately, because the working directory is mounted as a volume in /toc in the VM, which is then mounted as a volume /toc in the docker container.

Terminal commands (other than git commands) need to be run inside specific docker containers, which have various development dependencies already installed and configured.

To run arbitrary commands inside the toc-dev docker container:

1. SSH into the Vagrant VM:
  ```
  vagrant up
  vagrant ssh
  ```

2. Run the docker interactive shell via the following alias:
  ```
  toc
  jspm install angular
  jspm bundle www/app.js
  ```

3. Now you can run any combination of commands inside the toc-dev docker container!

4. You can also append commands after the toc alias to run them inline:
  ```
  toc jspm install angular
  ```

Note that changes to the docker environment will be discarded on exit, and only changes to the mounted source files volume will be persisted (such as installing new dependencies via jspm install).

To make modifications to the dev environment itself, edit the Dockerfile and rebuild the containers by running `vagrant provision` on your host OS.

## Docker Aliases

I have provided several aliases in the Vagrant VM for quick access to common docker workflows (such as toc, toce, tocb mentioned above). See their implementations in [vagrant-provision.sh](vagrant-provision.sh).

Let me know if you have suggestions for any aliases for other common tasks. Or better yet, make a PR for it yourself!
