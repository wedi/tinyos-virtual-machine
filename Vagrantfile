# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'lib/helper'

Vagrant.configure("2") do |config|

    # Using a quality bento box from the makers of chef
    # https://github.com/chef/bento
    config.vm.box = "bento/ubuntu-16.04"
    # Disable update checking - it always raises a warning.
    config.vm.box_check_update = false

    $boxname = "WSN-Box"

    config.vm.hostname = $boxname.downcase

    # Set up shared folders
    # src folder on host machine -> path on VM (will be created)
    config.vm.synced_folder "~/dev/wsn/rti/", "/home/vagrant/rti"


    # Configuration for VirtualBox
    config.vm.provider :virtualbox do |v|

        # Display name
        v.name = $boxname

        # Configure the box's "hardware"
        v.cpus = 1
        v.memory = 512
        v.customize ["modifyvm", :id, "--vram", "12"]

        # Enable USB and add a filter for TelosB motes
        v.customize ["modifyvm", :id, "--usb", "on"]
        v.customize ["modifyvm", :id, "--usbehci", "on"]
        better_usbfilter_add(v, "0403", "6001", "Auto-attach TelosB motes")

        # Misc settings
        v.customize ["modifyvm", :id, "--ioapic", "on"]
        v.customize ["modifyvm", :id, "--acpi", "on"]
        v.customize ["modifyvm", :id, "--paravirtprovider", "default"]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    end


    # Run Ansible on the Vagrant VM
    config.vm.provision "ansible_local" do |ansible|

        ansible.install = true
        ansible.verbose = ""  # vvv
        ansible.playbook = "provisioning/playbook.yml"
        ansible.galaxy_role_file = "provisioning/requirements.yml"
        # Stop to download all roles on every `vagrant up` while testing.
        # (Removing --force)
        # ansible.galaxy_command = "ansible-galaxy install --role-file=%{role_file} --roles-path=%{roles_path}"
        ansible.extra_vars = {
          # pass the version of VirtualBox to Ansible. Might be useful later
          # to autoupdate the VirtualBox system integration.
          vbox_version: `VBoxManage -V | sed 's/r.*//'`.strip
        }
    end

    # rename the ugly "default" name vagrant uses
    config.vm.define $boxname.downcase

end
