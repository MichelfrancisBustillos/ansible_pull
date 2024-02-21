# ansible_pull

## Functions

- Install Default Packages:
  - libsasl2-modules
  - [mailutils](https://mailutils.org/)
  - [nano](https://www.nano-editor.org/)
  - [cron](https://wiki.debian.org/cron)
  - [sudo](https://www.sudo.ws/)
  - [neofetch](https://github.com/dylanaraps/neofetch)
  - [unattended-upgrades](https://wiki.debian.org/UnattendedUpgrades)
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

## Requirements

- ansible
- git

## Installation

```bash
apt install ansible -y
apt install git -y
sudo ansible-pull -U https://github.com/MichelfrancisBustillos/ansible_pull.git
```
