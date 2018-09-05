echo "Increase swap..." 
swapsize=8000
grep -q "swapfile" /etc/fstab
if [ $? -ne 0 ]; then
    echo "Swapfile not found. Adding swapfile..." > /dev/stderr
    fallocate -l ${swapsize}M /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    echo '/swapfile none swap defaults 0 0' >> /etc/fstab
else
    echo "Swapfile found. No changes made..." 
fi
df -h
cat /proc/swaps
cat /proc/meminfo | grep Swap