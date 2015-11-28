## Instructions to set up Virtual Machine  


### Steps to create Virtual Machine  
1. Install [Oracle VM VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html) on your system. Both softwares are compatible with Windows and Linux. After installing Vagrant, ensure that the `vagrant` program is part of your `PATH`.
2. Create a new directory on your machine.
3. Navigate into that directory and copy the [Vagrantfile](https://github.com/SoftwareEngineeringToolDemos/ICSE-2012-GraPacc/blob/master/build-vm/Vagrantfile) AND the [install.sh](https://github.com/SoftwareEngineeringToolDemos/ICSE-2012-GraPacc/blob/master/build-vm/install.sh) provisioning file into that directory.
4. Run `vagrant up` inside that directory. This will create a fresh Ubuntu 14.04 LTS machine. Since this tool is a java based tool, the script will install java 7 on the virtual machine.
5. Observe the execution shell on your machine. Please wait until the execution is done.
6. After the machine is up, you have three options to log into the machine
   * From the same directory, run `vagrant ssh` and wait for the VM terminal to show up. This does not require you to enter a username or password.
   * Use an SSH client like [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) with the hostname `127.0.0.1` on port `2222`. Requires username and password.
   * Use the GUI provided by the VM. Requires password.
7. Verify java installation by running the following commands.
   * `which java`
   * `java -version`

### VM Credentials
* Username: `vagrant`
* Password: `vagrant`  

### References
* https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get
* https://docs.vagrantup.com/v2/provisioning/shell.html
* https://docs.vagrantup.com/v2/virtualbox/configuration.html
* Vagrant VirtualBox image used: https://atlas.hashicorp.com/box-cutter/boxes/ubuntu1404-desktop
