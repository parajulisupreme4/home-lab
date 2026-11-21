# Home Lab

Personal lab for practising IT support, systems administration and cyber security.
Builds, configs and troubleshooting notes are documented here.

## Hardware

| Device | Role | Specs |
|---|---|---|
| Old PC | Always-on Ubuntu server running CasaOS (Docker) | [CPU] / [RAM] / [storage] |
| Lenovo Legion 5 | Windows 11 host for VirtualBox VMs | Ryzen 7 260 / 16 GB RAM |

## What's running

**Ubuntu server (CasaOS)**
- Samba file sharing, mapped as a network drive on Windows
- SSH remote administration

**VirtualBox (on the Legion)**
- `DC01`: Windows Server 2025 domain controller for `lab.local` (AD DS, DNS) *(in progress)*
- Kali Linux + Metasploitable 2: penetration testing practice

## Planned
- [ ] DHCP reservation and Tailscale remote access
- [ ] Uptime Kuma monitoring
- [ ] Automated backups with restic
- [ ] Windows 11 client joined to `lab.local`, Group Policy practice
- [ ] Wazuh SIEM with agents on lab machines

## Repo layout
- `services/`: Docker Compose files and setup notes for each service
- `active-directory/`: AD lab build steps, OUs, GPOs
- `troubleshooting/`: write-ups of problems I diagnosed and fixed
