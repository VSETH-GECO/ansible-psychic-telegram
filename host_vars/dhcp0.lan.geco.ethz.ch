netconf:
  if:
    ens18:
      ip: 10.233.253.3/24
      gateway: 10.233.253.1
      dns: 10.10.200.2
      dnssearch: lan.geco.ethz.ch

interfacev4: ens18

dhcp:
  role: primary
  ip: 10.233.253.3
  peer: 10.233.253.4
  domain: lan.geco.ethz.ch
  dns: "{{ netconf.if.ens18.dns }}"
  subnets:
    - ip: 10.10.102.0
      router: 10.10.102.1
      range: 10.10.102.10 10.10.102.200
    - ip: 10.233.253.0
      router: 10.233.253.1
      range: 10.233.253.100 10.233.253.110
 
