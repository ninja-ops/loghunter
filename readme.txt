loghunter

--
almalinux:

dnf install squid

:/etc/squid/squid.conf
shutdown_lifetime 1 second
logformat custom %>a %ru %{User-Agent}>h
access_log stdio:/var/log/squid/custom.log logformat=custom
access_log stdio:/var/log/squid/combined.log logformat=combined

:
systemctl start squid

--
ubuntu

apt install squid

:/etc/squid/conf.d/debian.conf

shutdown_lifetime 1 second
logformat custom %>a %ru %{User-Agent}>h
access_log stdio:/var/log/squid/custom.log logformat=custom
access_log stdio:/var/log/squid/combined.log logformat=combined

:
systemctl restart squid

--
