network_kill_cloudconfig: True

netconf:
  if:
    eth0:
      ip: 10.233.253.70/24
      gateway: 10.233.253.1
      dns: 10.233.200.2 10.233.200.1
      dnssearch: lan.geco.ethz.ch
