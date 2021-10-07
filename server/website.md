# Web Server

Below is a checklist to run through when setting up a new website:

1. Acquire domain name (e.g. www.mock.com)
2. Acquire VPS hosting
3. Create new user on VPS
4. Grant new user `sudo` privileges
5. Setup SSH using keys for new user
6. Disable root password-login via SSH
7. Change default SSH port
8. Delete out-dated packages, if they're installed:
  - Telnet
  - RSH server
  - NIS server
  - TFTP server
  - TALK server
9. Update to latest packages
10. Check for needlessly open ports
11. Disable certain network parameters in `/etc/sysctl.conf`:
  - `net.ipv4.ip_forward=0`
  - `net.ipv4.conf.default.send_redirects=0`
  - `net.ipv4.conf.default.accept_redirects=0`
  - `net.ipv4.icmp_ignore_bogus_error_responses=1`
12. Install Apache Web Server (`apache2`)
13. Setup Apache Web Server settings in `/etc/apache2` and put website data in `/var/www`
14. Make sure that `apache2` and `sshd` start on start up (e.g. `systemctl enable apache2`)
15. Setup SSL certificate for the website using `www.letsencrypt.org`
