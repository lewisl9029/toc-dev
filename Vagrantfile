VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  if ENV["TOC_HOST_IP"]
    host_ip = ENV["TOC_HOST_IP"];
    puts "Using #{host_ip} for device livereload."
  else
    host_ip = "127.0.0.1"
    puts "Set $TOC_HOST_IP and reprovision to enable device livereload."
  end
  # config.vm.box = ENV["TOC_VAGRANT_BOX"]
  config.vm.box = "puphpet/ubuntu1404-x64"
  config.vm.provision :shell, path: "toc-setup-env.sh",
    privileged: false, args: host_ip
  config.vm.provision :shell, path: "vagrant-provision.sh",
    privileged: false

  config.vm.boot_timeout = 600

  # toc ports
  config.vm.network "forwarded_port", guest: 8100, host: 8100 # http server
  config.vm.network "forwarded_port", guest: 8101, host: 8101 # livereload
  config.vm.network "forwarded_port", guest: 8102, host: 8102 # karma server
  # toc landing ports
  if ENV["TOC_LANDING_PATH"]
    config.vm.network "forwarded_port", guest: 8200, host: 8200 # http server
    config.vm.network "forwarded_port", guest: 8201, host: 8201 # livereload
  end
  # config.vm.network "forwarded_port", guest: 8201, host: 8201 # apt cache
  # config.vm.network "forwarded_port", guest: 8202, host: 8202 # npm cache
  # config.vm.network "forwarded_port", guest: 8203, host: 8203 # selenium server

  config.vm.synced_folder ".", "/home/vagrant/toc-env"
  config.vm.synced_folder ENV["TOC_PATH"], "/home/vagrant/toc"
  if ENV["TOC_LANDING_PATH"]
    config.vm.synced_folder ENV["TOC_LANDING_PATH"], "/home/vagrant/toc-landing"
  end
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
    vm.memory = 512
  end

  config.vm.provider "vmware_workstation" do |vm, override|
    # vm.gui = true
    vm.vmx["memsize"] = "512"
    vm.vmx["numvcpus"] = "1"
    vm.vmx["vmx.allowNested"] = "TRUE"
    vm.vmx["ehci.present"] = "TRUE"
    vm.vmx["usb.present"] = "TRUE"
  end

  config.vm.provider "hyperv" do |vm, override|
    override.vm.box = "ericmann/trusty64"
    begin
      require_relative "secrets/vagrant-secrets"

      override.vm.synced_folder ".", "/home/vagrant/toc-env",
        smb_username: SMB_USERNAME, smb_password: SMB_PASSWORD
      override.vm.synced_folder ENV["TOC_PATH"], "/home/vagrant/toc",
        smb_username: SMB_USERNAME, smb_password: SMB_PASSWORD
      if ENV["TOC_LANDING_PATH"]
        override.vm.synced_folder ENV["TOC_LANDING_PATH"],
          "/home/vagrant/toc-landing",
          smb_username: SMB_USERNAME, smb_password: SMB_PASSWORD
      end
    rescue LoadError
      override.vm.synced_folder ".", "/home/vagrant/toc-env"
      override.vm.synced_folder ENV["TOC_PATH"], "/home/vagrant/toc"
      if ENV["TOC_LANDING_PATH"]
        override.vm.synced_folder ENV["TOC_LANDING_PATH"],
          "/home/vagrant/toc-landing"
      end
    end
  end
end
