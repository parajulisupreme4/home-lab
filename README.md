# Home Lab

Personal lab for practising IT support, systems administration and cyber security.
Builds, configs and troubleshooting notes are documented here.

## Hardware

| Device | Role | Specs |
|---|---|---|
| Old PC | Always-on Ubuntu server running CasaOS (Docker) | Intel i9 / 8GB / 512GB |
| Lenovo Legion 5 | Windows 11 host for VirtualBox VMs | Ryzen 7 260 / 16 GB RAM |

## What's running

**Ubuntu server (CasaOS)**
- Samba file sharing, mapped as a network drive on Windows
- SSH remote administration

**VirtualBox (on the Legion)**
- `DC01`: Windows Server 2025 domain controller for `lab.local` (AD DS, DNS).
  See the [Active Directory lab write-up](active-directory/README.md).
- Kali Linux + Metasploitable 2: penetration testing practice

## Completed
- [x] Samba share access from Windows 11 ([troubleshooting write-up](troubleshooting/2026-11-samba-windows11-guest-access.md))
- [x] Windows Server 2025 domain controller, `lab.local` forest
- [x] LabCorp OU structure, security groups and users
- [x] Service desk practice: password resets, unlocks, leavers, moves, account expiry

## Planned
- [ ] Windows 11 client (CLIENT01) joined to `lab.local`
- [ ] Group Policy: password policy, mapped drives, desktop restrictions
- [ ] DHCP reservation and Tailscale remote access for the Ubuntu server
- [ ] Uptime Kuma monitoring
- [ ] Automated backups with restic
- [ ] Wazuh SIEM with agents on lab machines

## Repo layout
- `active-directory/`: AD lab build steps, screenshots and scripts
- `troubleshooting/`: write-ups of problems I diagnosed and fixed
- `services/`: Docker Compose files and setup notes for each service (coming soon)
