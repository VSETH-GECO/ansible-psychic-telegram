network_squash_config: True

netconf:
  bridge:
    vmbr0:
      parent: enp2s0f0
      ip: 10.233.253.247/24
      gateway: 10.233.253.1
      dns: 10.10.200.2 10.10.0.200
      dnssearch: lan.geco.ethz.ch
