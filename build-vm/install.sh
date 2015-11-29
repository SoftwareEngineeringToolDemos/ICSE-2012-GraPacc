#!/usr/bin/env bash

# Install the required software on the machine
echo "Updating Repository..."
apt-get update > /dev/null 2>&1

echo "Installing JRE..."
apt-get install -y openjdk-7-jre > /dev/null 2>&1

echo "Installing JDK..."
apt-get install -y openjdk-7-jdk > /dev/null 2>&1

echo "Installing git: Temporary installation..."
apt-get install -y git > /dev/null 2>&1

# Download eclipse IDE from the eclipse website.
echo "Downloading eclipse from website..."
wget --no-check-certificate --quiet -nv -O eclipse_3_6_2.tar.gz http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/helios/SR2/eclipse-java-helios-SR2-linux-gtk-x86_64.tar.gz

# Extract eclipse and change ownership of folders/files.
echo "Extracting eclipse files..."
mkdir Eclipse
tar zxf eclipse_3_6_2.tar.gz -C ./Eclipse > /dev/null 2>&1
sudo chown -R vagrant:vagrant Eclipse

# Download plugin from website and copy required files into 
# eclipse plugins and features directories.
echo "Downloading plugin and setting up eclipse..."
cd Downloads
wget --no-check-certificate --quiet -nv -O GraPaccPlugin.zip http://home.engineering.iastate.edu/~anhnt/Research/GraPacc/Files/GraPaccPlugin_Update.zip
wget --no-check-certificate --quiet -nv http://home.engineering.iastate.edu/~anhnt/Research/GraPacc/Files/PatternsJAVAUTIL110404.zip
unzip GraPaccPlugin.zip > /dev/null 2>&1
unzip PatternsJAVAUTIL110404.zip > /dev/null 2>&1
cp -r -f ./CodeCompletionInstall2/features/* ../Eclipse/eclipse/features/
cp -r -f ./CodeCompletionInstall2/plugins/* ../Eclipse/eclipse/plugins/

echo "Setting up machine..."
# Make temporary directories. Will be removed at the end.
cd /home/vagrant
mkdir workspace
mkdir ProjectData

# Clone repository. Set appropriate ownership and permission.
cd ProjectData
git clone https://github.com/aneeshkher/SE_Project_Files.git
sudo chown -R vagrant:vagrant /home/vagrant/ProjectData
sudo chown -R vagrant:vagrant /home/vagrant/workspace

# Copy Files into appropriate directories.
echo "Copying files to Desktop..."
cd SE_Project_Files
cp -r .metadata/ /home/vagrant/workspace/
cp -r GraPaccDemo/ /home/vagrant/workspace/
cp installation.txt /home/vagrant/Desktop
cp README.txt /home/vagrant/Desktop
cp licenses /home/vagrant/Desktop
cp ToolDemo.desktop /home/vagrant/Desktop
sudo chown -R vagrant:vagrant /home/vagrant/workspace
sudo chown -R vagrant:vagrant /home/vagrant/Desktop

# Configure eclipse to autostart.
echo "Configuring eclipse to auto start..."
mkdir -p /home/vagrant/.config/autostart
sudo chown -R vagrant:vagrant /home/vagrant/.config/autostart
cp eclipse.desktop /home/vagrant/.config/autostart/

# Make link to eclipse on desktop
cp /home/vagrant/.config/autostart/eclipse.desktop /home/vagrant/Desktop
chmod +x /home/vagrant/Desktop/eclipse.desktop
sudo chown -R vagrant:vagrant /home/vagrant/Desktop

# Configure machine to disable screen lock and enable autologin
echo "Disabling lock screen..."
sudo mkdir /etc/lightdm/lightdm.conf.d
sudo touch /etc/lightdm/lightdm.conf.d/50-myconfig.conf
sudo chmod 777 /etc/lightdm/lightdm.conf.d/50-myconfig.conf
sudo echo -e "[SeatDefaults]\nautologin-user=vagrant" >>  /etc/lightdm/lightdm.conf.d/50-myconfig.conf
sudo chmod 644 /etc/lightdm/lightdm.conf.d/50-myconfig.conf
cp disable-screen-lock.desktop /home/vagrant/.config/autostart/

# Change ownership
sudo chown -R vagrant:vagrant /home/vagrant/.config/autostart
cd /home/vagrant
sudo chown -R vagrant:vagrant ProjectData
sudo chown -R vagrant:vagrant workspace

# ========== Delete unwanted software/fles ============
# Uninstall some unwanted software
echo "Removing unwanted software..."
sudo apt-get remove -y --purge libreoffice* > /dev/null 2>&1
sudo apt-get purge -y unity-webapps-common > /dev/null 2>&1
sudo apt-get remove -y unity-webapps-common > /dev/null 2>&1
sudo apt-get remove -y git > /dev/null 2>&1

# Remove unwanted icons from the sidebar
echo "Removing icons from sidebar..."
sudo rm -f "/usr/share/applications/libreoffice-calc.desktop" 2 > /dev/null
sudo rm -f "/usr/share/applications/libreoffice-writer.desktop" 2 > /dev/null
sudo rm -f "/usr/share/applications/libreoffice-impress.desktop" 2 > /dev/null
sudo rm -f "/usr/share/applications/ubuntu-software-center.desktop" 2 > /dev/null
sudo rm -f "/usr/share/applications/ubuntuone-installer.desktop" 2 > /dev/null
sudo rm -f "/usr/share/applications/ubuntu-amazon-default.desktop" 2 > /dev/null

# Remove unnecessary files on the machine
echo "Removing unnecessary files and folders..."
sudo rm -rf /home/vagrant/SE_Project_Files
sudo rm -rf /home/vagrant/ProjectData
sudo rm -f /home/vagrant/Downloads/PatternsJAVAUTIL110404.zip
sudo rm -f /home/vagrant/eclipse_3_6_2.tar.gz
sudo rm -f /home/vagrant/Downloads/GraPaccPlugin.zip
sudo rm -rf Documents/ Videos/ Templates/ Pictures/ Music/ Public/

# Reboot for changes to take place
echo "Configuration done! Rebooting..."
echo "Please wait for about 4 minutes for the reboot to complete"
sudo init 6
