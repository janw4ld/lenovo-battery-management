# lenovo-battery-management
`acpi_call` based scripts to manage rapid charging and battery conservation on lenovo laptops with optional systemd services.

to install the scripts run
```
git clone https://github.com/janw4ld/lenovo-battery-management.git
cd lenovo-battery-management
./install.sh
```

this packages adds the following commands
```
battery-conservation-on
battery-conservation-off
rapid-charge-on
rapid-charge-off
```
as well as the optional systemd services
```
battery-conservation.service
rapid-charge.service
```
these services are configured as mutually exclusive, so enabling battery conservation automatically disables rapid charge and vice versa.

the commands can be only run as root but if you opt-in for the systemd services, aliases can be optionally added to your .bashrc to replace the command names with equivalent `systemctl {enable,disable}` commands that are configured to run as root without asking for password, as well as adding an extra `charging-status` command that reports the status of rapid-charge and battery-conservation services concisely.
