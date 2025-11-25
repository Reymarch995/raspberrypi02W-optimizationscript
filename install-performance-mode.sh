#!/bin/bash
echo "Rayhan's Raspberry Pi 0 2W performance script!"
echo "Applying Performance Mode..."

# 1. CPU governor
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# 2. Reduce journald spam
sudo sed -i 's/#Storage=auto/Storage=volatile/g' /etc/systemd/journald.conf
sudo systemctl restart systemd-journald

# 3. Lower priority for system housekeeping
sudo renice -n 19 -p 1

# 4. Tune zram (better compression ratio)
echo lz4 | sudo tee /sys/block/zram0/comp_algorithm >/dev/null 2>&1 || true

# 5. Disable unnecessary services
for s in bluetooth ModemManager avahi-daemon; do
    sudo systemctl disable --now $s 2>/dev/null
done

# 6. Slight VM tuning
echo 200 | sudo tee /proc/sys/vm/swappiness
echo 5   | sudo tee /proc/sys/vm/dirty_background_ratio
echo 20  | sudo tee /proc/sys/vm/dirty_ratio

echo "Performance mode applied! :D"
