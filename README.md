# ➤ ansible_pull

[![ansible-lint](https://github.com/MichelfrancisBustillos/ansible_pull/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/MichelfrancisBustillos/ansible_pull/actions/workflows/ansible-lint.yml)

## ➤ Overview

This Ansible playbook automates the setup and configuration of a Debian-based system with a variety of tools and services. It ensures that the system is consistently configured and up-to-date by pulling the latest changes from a Git repository and applying them at regular intervals.

## ➤ Functions

### Install Default Packages

Installs a set of essential packages to ensure the system has the necessary tools and utilities:

- `libsasl2-modules`: Provides SASL authentication modules.
- [mailutils](https://mailutils.org/): A collection of mail-related utilities.
- [micro](https://micro-editor.github.io/): A modern and intuitive terminal-based text editor.
- [cron](https://wiki.debian.org/cron): A time-based job scheduler.
- [sudo](https://www.sudo.ws/): Allows a permitted user to execute a command as the superuser or another user.
- [neofetch](https://github.com/dylanaraps/neofetch): A command-line system information tool.
- [unattended-upgrades](https://wiki.debian.org/UnattendedUpgrades): Automatically installs security upgrades.
- [pipx](https://pipx.pypa.io/stable/): Installs and runs Python applications in isolated environments.
- [glances](https://github.com/nicolargo/glances): A cross-platform monitoring tool.
- [iperf3](https://iperf.fr/): A tool for active measurements of the maximum achievable bandwidth on IP networks.

### Create Default User

Creates a user named `michel` with a predefined password to ensure a consistent user environment.

### Configure Default Terminal Environment

Copies `.bashrc` and `.bash_aliases` files to the localhost to set up a customized terminal environment with useful aliases and configurations.

### Onboard Host to [NetData](https://www.netdata.cloud/)

Installs and configures NetData for real-time system monitoring, providing insights into system performance and health.

### Set up Unattended Upgrades

Configures the system to automatically install OS updates, including ProxMox and Docker updates, ensuring the system remains secure and up-to-date without manual intervention.

### Set up Email Notifications via [Postfix](https://www.postfix.org/)

Configures Postfix to send notifications to Pushover via email, enabling real-time alerts for system events and issues.

### Enable Regular Ansible Syncs via Cron

Sets up a cron job to run the Ansible pull command every 6 hours. This ensures that the system configuration is regularly updated by pulling the latest changes from the Git repository.

### Install and Enable Tailscale with SSH

Installs Tailscale, a zero-config VPN, and configures it to allow SSH access, providing secure remote access to the system.

### Mount CIFS Share

Mounts a CIFS (SMB) share to the system, allowing access to network file shares.

### Install Glances with All Modules via Pipx

Installs Glances and all its modules using Pipx and enables the Glances webserver, providing a comprehensive monitoring solution accessible via a web interface.

## ➤ Requirements

- [Ansible](https://www.ansible.com/)
- [Git](https://git-scm.com/)

## ➤ Usage

1. Clone the repository:

   ```sh
   git clone https://github.com/MichelfrancisBustillos/ansible_pull.git
   cd ansible_pull
   ```

2. Run the playbook:

   ```sh
   ansible-playbook -i inventory playbook.yml
   ```

## ➤ Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## ➤ License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
