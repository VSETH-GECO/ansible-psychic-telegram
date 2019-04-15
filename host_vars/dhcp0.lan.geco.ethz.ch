netconf:
  if:
    ens18:
      ip: 10.233.253.3/24
      gateway: 10.233.253.1
      dns: 10.233.200.2 10.233.200.1
      dnssearch: lan.geco.ethz.ch

interfacev4: ens18

dhcp:
  role: primary
  ip: 10.233.253.3
  peer: 10.233.253.4
  domain: lan.geco.ethz.ch
  dns: "{{ netconf.if.ens18.dns }}"
