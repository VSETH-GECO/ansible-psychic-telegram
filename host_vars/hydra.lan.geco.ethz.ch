network_squash_config: True

netconf:
  bridge:
    vmbr0:
      parent: enp2s0f0
      ip: 10.233.253.247/24
      gateway: 10.233.253.1
      dns: 10.233.200.2 10.233.200.1
      dnssearch: lan.geco.ethz.ch
