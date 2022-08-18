# L4 Forwarding
- After loading firmware, please turn off tcp checksum offloading through instructions below
``sh
sudo ethtool -k <netdev>         # Check netdev options
sudo ethtool -K <netdev> tx off  # Turn off RX TCP Checksum offload
sudo ethtool -K <netdev> rx off  # Turn off TX TCP Checksum offload
```
