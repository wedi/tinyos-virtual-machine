# Virtual Machine for TinyOS with Vagrant and Ansible
Setup a virtual machine to build [TinyOS] firmware for wireless sensor motes in no time.
Runs with [VirtualBox] and [Ansible] but do not fear. Even if you don't know these in depth – I've got you covered.


## Installation

It's easy as 1, 2, 3.

```sh
git clone git@github.com:wedi/tinyos-virtual-machine.git
cd tinyos-virtual-machine
vagrant up --provider virtualbox
```

Go and get a  :coffee: or a  :beer: during the first run. It will take some time to to downloaded and install all the software.  
⇒ Now you are having a VM, readily provisoned with everything you need to build TinyOS firmware.  :tada:

Hit `vagrant ssh` to login.


## Configuration

TODO... _(you know what that stands for... :grin:)_

- Have a look into the [Vagrantfile]. Most likely you want to adjust the shared folder.
- You will find more options in [provisioning/vars/main.yml][vars/main.yml].

## Requirements

You need to install [VirtualBox] and [Vagrant]. That's it.

## Limitation

Right now only the MSP430 microcontroller (e.g. used on TelosB motes) is supported because that's the only one I am using. Feel free to [open an issue][issue-mcu] on my related Ansible project if you need support for a different one.


## License

This role is released under the terms of the [MIT license].

## About the author

Hi, I'm Dirk from Essen, Germany. Software developer, student of business and computer science. I wrote this role to learn provisioning and configuration management with Ansible. I hope you find it useful. Feel free to [open an issue] or pull request if you are having any suggestions.



[TinyOS]:           https://github.com/tinyos
[Ansible]:          https://www.ansible.com/
[Vagrantfile]:      https://github.com/wedi/tinyos-virtual-machine/blob/master/Vagrantfile
[vars/main.yml]:    https://github.com/wedi/tinyos-virtual-machine/blob/master/provisioning/vars/main.yml
[VirtualBox]:       https://www.virtualbox.org/
[Vagrant]:          https://www.vagrantup.com/
[MIT license]:      https://github.com/wedi/tinyos-virtual-machine/blob/master/LICENSE
[open an issue]:    https://github.com/wedi/tinyos-virtual-machine/issues
[issue-mcu]:        https://github.com/wedi/ansible-role-tinyos/issues
