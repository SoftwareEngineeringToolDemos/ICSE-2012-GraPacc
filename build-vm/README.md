## Instructions to set up Virtual Machine  


### Steps to create Virtual Machine  
1. Install [Oracle VM VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html) on your system. Both softwares are compatible with Windows and Linux. After installing Vagrant, ensure that the `vagrant` program is part of your `PATH`.
2. Create a new directory on your machine.
3. Navigate into that directory and copy the [Vagrantfile](https://github.com/SoftwareEngineeringToolDemos/ICSE-2012-GraPacc/blob/master/build-vm/Vagrantfile) AND the [install.sh](https://github.com/SoftwareEngineeringToolDemos/ICSE-2012-GraPacc/blob/master/build-vm/install.sh) provisioning file into that directory.
4. Run `vagrant up` inside that directory. This will create a fresh Ubuntu 14.04 LTS machine. Since this tool is a java based tool, the script will install java 7 on the virtual machine.
5. Observe the execution shell on your machine. Please wait until the execution is done.
6. Go to the virtual machine. You will see Eclipse already open.
7. In the Eclipse window, go to 'File', and click 'Refresh'. This will refresh the workspace and text editor.

Here is a [link to the repository](https://github.com/aneeshkher/SE_Project_Files) containing the support scripts and files used to create the VM.

### VM Credentials
* Username: `vagrant`
* Password: `vagrant`  

### References
* https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get
* https://docs.vagrantup.com/v2/provisioning/shell.html
* https://docs.vagrantup.com/v2/virtualbox/configuration.html
* Vagrant VirtualBox image used: https://atlas.hashicorp.com/box-cutter/boxes/ubuntu1404-desktop
* http://askubuntu.com/questions/450398/how-to-remove-amazon
* http://askubuntu.com/questions/180403/how-to-uninstall-libreoffice
* http://askubuntu.com/questions/17157/how-do-i-stop-the-screen-from-being-locked-on-suspend
* https://help.ubuntu.com/community/AutoLogin
