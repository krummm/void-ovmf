# void-ovmf
Short shell script to install OVMF on Void Linux
```
Dependencies: wget zstd
```
# Instructions
```
Download voidovmf.sh
sudo chmod +x voidovmf.sh
./voidovmf.sh
Enter your sudo password when prompted
Done.
```
# Notes
File will not automatically be placed in /var/lib/libvirt/qemu/nvram/, and the VM will likely fail to start due to this. To fix this, simply symlink the file like so:
```
sudo ln -s /usr/share/edk2-ovmf/x64/OVMF_VARS.fd /var/lib/libvirt/qemu/nvram/<your-VM-name>_VARS.fd
```
You may then need to specify the location of the resulting symlink in your VM XML file. Add this to the <os> block in your XML:
<nvram>/var/lib/libvirt/qemu/nvram/<your-VM-name>_VARS.fd</nvram>
