echo "installing lenovo battery management tools for $USER"
sudo cp -a scripts/. /usr/bin/
for i in scripts/*; do chmod +x "/usr/bin/$(basename $i)"; done

read -p "do you want to install systemd services? (y/n) " yn
case $yn in 
	[yY] )  sudo cp -a services/. /etc/systemd/system/
            echo "$USER ALL=(ALL) NOPASSWD: /bin/systemctl * battery-conservation*, /bin/systemctl * rapid-charge*" | sudo tee -a /etc/sudoers.d/battery-management > /dev/null
            sudo chmod 0440 /etc/sudoers.d/battery-management
                read -p "do you want to add .bashrc aliases for systemd? (y/n) " yn
                case $yn in 
	                [yY] )  echo -e "alias battery-conservation-on='sudo systemctl enable --now battery-conservation'\nalias battery-conservation-off='sudo systemctl disable --now battery-conservation'\nalias rapid-charge-on='sudo systemctl enable --now rapid-charge'\nalias rapid-charge-off='sudo systemctl disable --now rapid-charge'\nalias charging-status='printf \"rapid-charge is \"; systemctl is-enabled rapid-charge; printf \"and \"; systemctl is-active rapid-charge; printf \"battery-conservation is \"; systemctl is-enabled battery-conservation; printf \"and \"; systemctl is-active battery-conservation;'" >> ~/.bashrc
                    ;;
                    *    )  echo "skipping aliases"
                    ;;
                esac
                ;;
	*    )  echo "skipping systemd services"
            ;;
esac


echo -e "lenovo battery management tools installed"