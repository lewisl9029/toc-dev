VAGRANTFILE_API_VERSION = "2"

# if ENV["TOC_VAGRANT_BOX"]
#   puts "Using box ", ENV["TOC_VAGRANT_BOX"]
# else
#   puts "Please set TOC_VAGRANT_BOX to a Ubuntu 14.04 based Vagrant box."
#   puts "Browse for available boxes here:"
#   puts "https://atlas.hashicorp.com/boxes/search"
# end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # config.vm.box = ENV["TOC_VAGRANT_BOX"]
  config.vm.box = "chef/ubuntu-14.04"
  config.vm.provision :shell, path: "toc-setup-env.sh",
    privileged: false
  config.vm.provision :shell, path: "vagrant-provision.sh",
    privileged: false

  config.vm.network "forwarded_port", guest: 8100, host: 8100 # http server
  config.vm.network "forwarded_port", guest: 8101, host: 8101 # livereload
  config.vm.network "forwarded_port", guest: 8102, host: 8102 # karma server
  # config.vm.network "forwarded_port", guest: 8201, host: 8201 # apt cache
  # config.vm.network "forwarded_port", guest: 8202, host: 8202 # npm cache
  # config.vm.network "forwarded_port", guest: 8203, host: 8203 # selenium server

  config.vm.synced_folder ".", "/home/vagrant/toc-env"
  config.vm.synced_folder ENV["TOC_PATH"], "/home/vagrant/toc"
  # config.vm.synced_folder ".", "/home/vagrant/toc", type: "nfs"
  # config.vm.network "private_network", type: "dhcp"
  # config.winnfsd.logging = "on"
  # config.winnfsd.uid = 900
  # config.winnfsd.gid = 900
#  config.vm.synced_folder "./.cache", "/var/cache/toc",
#    create: true,
#    owner: "vagrant",
#    mount_options: ["dmode=777,fmode=777"]
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "virtualbox" do |vm|
    vm.memory = 1024
  end

  config.vm.provider "vmware_workstation" do |vm|
    # vm.gui = true
    vm.vmx["memsize"] = "1024"
    # vm.vmx["vmx.allowNested"] = "TRUE"
  end

  config.vm.provider "hyperv" do |vm, override|
    require_relative "secrets/vagrant-secrets"
    override.vm.box = "cirex/ubuntu-14.04"

    override.vm.synced_folder ".", "/home/vagrant/toc-env", smb_username: SMB_USERNAME, smb_password: SMB_PASSWORD
    override.vm.synced_folder ENV["TOC_PATH"], "/home/vagrant/toc", smb_username: SMB_USERNAME, smb_password: SMB_PASSWORD
  end
end
