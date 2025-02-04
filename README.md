# ➤ ansible_pull

[![ansible-lint](https://github.com/MichelfrancisBustillos/ansible_pull/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/MichelfrancisBustillos/ansible_pull/actions/workflows/ansible-lint.yml)

## ➤ Overview

This Ansible playbook automates the setup and configuration of a Debian-based system with a variety of tools and services. It ensures that the system is consistently configured and up-to-date by pulling the latest changes from a Git repository and applying them at regular intervals.

## ➤ Functions

- **Install Default Packages:**
  - libsasl2-modules
  - [mailutils](https://mailutils.org/)
  - [micro](https://micro-editor.github.io/)
  - [cron](https://wiki.debian.org/cron)
  - [sudo](https://www.sudo.ws/)
  - [neofetch](https://github.com/dylanaraps/neofetch)
  - [unattended-upgrades](https://wiki.debian.org/UnattendedUpgrades)
  - [pipx](https://pipx.pypa.io/stable/)
  - [glances](https://github.com/nicolargo/glances)
- **Create Default User:**
  - Creates a user named `michel` with a predefined password.
- **Configure Default Terminal Environment:**
  - Copies `.bashrc` and `.bash_aliases` files to the localhost to set up the terminal environment.
- **Onboard Host to [NetData](https://www.netdata.cloud/):**
  - Installs and configures NetData for system monitoring.
- **Set up Unattended Upgrades:**
  - Configures the system to automatically install OS updates, including ProxMox and Docker updates.
- **Set up Email Notifications via [Postfix](https://www.postfix.org/):**
  - Configures Postfix to send notifications to Pushover via email.
- **Enable Regular Ansible Syncs via Cron:**
  - Sets up a cron job to run the Ansible pull command every 6 hours, executing it if the repository has changed.
- **Install and Enable Tailscale with SSH:**
  - Installs Tailscale and configures it to allow SSH access.
- **Mount CIFS Share:**
  - Mounts a CIFS (SMB) share to the system.
- **Install Glances with All Modules via Pipx:**
  - Installs Glances and all its modules using Pipx and enables the Glances webserver.

## ➤ Requirements

- ansible
- git
