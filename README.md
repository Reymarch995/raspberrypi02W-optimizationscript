# Raspberry Pi Zero 2W Optimization Script

A performance optimization script for the Raspberry Pi Zero 2W that applies various system-level tweaks to maximize performance.

## Features

This script applies the following optimizations:

- **CPU Governor**: Sets the CPU scaling governor to "performance" mode for maximum CPU speed
- **Journald Optimization**: Configures systemd-journald to use volatile storage, reducing disk I/O
- **Process Priority Tuning**: Lowers priority of system housekeeping processes (PID 1) to prioritize user workloads
- **Zram Compression**: Configures zram to use lz4 compression algorithm for better performance
- **Service Cleanup**: Disables unnecessary services (Bluetooth, ModemManager, avahi-daemon)
- **VM Tuning**: Optimizes virtual memory settings:
  - Swappiness set to 200 for aggressive swap usage
  - Dirty background ratio set to 5%
  - Dirty ratio set to 20%

## Requirements

- Raspberry Pi Zero 2W (or compatible Raspberry Pi model)
- Raspberry Pi OS or similar Debian-based Linux distribution
- Root/sudo access

## Installation & Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/Reymarch995/raspberrypi02W-optimizationscript.git
   ```

2. Navigate to the directory:
   ```bash
   cd raspberrypi02W-optimizationscript
   ```

3. Make the script executable:
   ```bash
   chmod +x install-performance-mode.sh
   ```

4. Run the script:
   ```bash
   ./install-performance-mode.sh
   ```

## ⚠️ Warning

- This script modifies system settings and disables services. Make sure you understand the changes before running.
- Some optimizations (like CPU governor) may increase power consumption and heat generation.
- Disabling Bluetooth and other services may affect functionality if you rely on them.
- The VM tuning settings are optimized for performance, not power efficiency.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.