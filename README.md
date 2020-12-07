# raspi-setup

#### What the script does

- Asks for a hostname to replace the default `raspberrypi` and updates it
- Updates software packages
- Installs an xrdp-server for `Windows Remote Desktop Connection`
- Installs an auto update script

#### Usage

```bash
cd /home/pi/ 
git clone https://github.com/jnsjknn/raspi-setup.git 
cd raspi-setup/ 
sudo bash setup.sh 
sudo rm -R /home/pi/raspi-setup/
```
or as a one-liner:

```bash
cd /home/pi/ && git clone https://github.com/jnsjknn/raspi-setup.git && cd raspi-setup/ && sudo bash setup.sh && sudo rm -R /home/pi/raspi-setup/
```