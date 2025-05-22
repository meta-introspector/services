
if [ ! -f /swapfile ]; then
    dd if=/dev/zero of=/swapfile bs=128M count=32
    sudo chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
fi

swapon -s
#To start the swap file at boot time, edit the /etc/fstab file. Open the file in the editor, and then run the following command:

#$ sudo vi /etc/fstab
#Add the following new line at the end of the file:
if [ $(grep -c swapfile /etc/fstab) -eq 1 ] ; then
  echo "swapfile already exists"
else
    echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
fi