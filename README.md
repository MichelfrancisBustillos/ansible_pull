# ➤ ansible_pull

[![ansible-lint](https://github.com/MichelfrancisBustillos/ansible_pull/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/MichelfrancisBustillos/ansible_pull/actions/workflows/ansible-lint.yml)

## ➤ Functions

- Install Default Packages:
  - libsasl2-modules
  - [mailutils](https://mailutils.org/)
  - [micro](https://micro-editor.github.io/)
  - [cron](https://wiki.debian.org/cron)
  - [sudo](https://www.sudo.ws/)
  - [neofetch](https://github.com/dylanaraps/neofetch)
  - [unattended-upgrades](https://wiki.debian.org/UnattendedUpgrades)
  - [pipx](https://pipx.pypa.io/stable/)
  - [glances](https://github.com/nicolargo/glances)
- Create Default User (michel) w/ Password
- Configure default terminal environment
  - .bashrc and .bash_aliases files copied to localhost.
- Onboard Host to [NetData](https://www.netdata.cloud/)
- Set up Unattended Upgrades via [unattended-upgrades](https://wiki.debian.org/UnattendedUpgrades)
  - All OS packages updated, plus ProxMox and Docker.
- Set up Email Notifications via [Postfix](https://www.postfix.org/)
  - Notifications sent to Pushover via email.
- Enable regular ansible syncs via Cron
  - Ansible pull command is run every 6 hours and executed if repository has been changed.
- Install and enable Tailscale w/ SSH
- Mount CIFS Share
- Install Glances with all modules via Pipx and enable Glances webserver

## ➤ Requirements

- ansible
- git
