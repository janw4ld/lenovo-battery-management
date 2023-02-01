# lenovo-battery-management
`acpi_call` based scripts to manage rapid charging and battery conservation on
lenovo laptops, with optional systemd services.  
**This was tested on 15ACH6 only**  
to install the scripts, ensure that acpi_call kernel module is installed and
loaded *which can be installed on fedora from the tlp repo* then run:  

```bash
git clone https://github.com/janw4ld/lenovo-battery-management.git
cd lenovo-battery-managemen
./install.sh
```

this adds the following commands

```bash
battery-conservation-on
battery-conservation-off
rapid-charge-on
rapid-charge-off
```

as well as the optional systemd services

```bash
battery-conservation.service
rapid-charge.service
```

these services are configured as mutually exclusive, so enabling battery
conservation automatically disables rapid charge and vice versa. you get this
functionality from the base scripts as well. the commands can be only run as
root ~~but~~ and if you opt-in for the systemd services, aliases can be
optionally added to your .bashrc to replace the command names with equivalent
`systemctl {enable,disable}` commands ~~that are configured to run as root
without asking for password,~~ as well as adding an extra `charging-status`
command that reports the status of rapid-charge and battery-conservation
services.
