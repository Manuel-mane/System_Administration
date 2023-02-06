#Creating a new Internal Virtual Switch
New-VMSwitch -SwitchName "192.168.3.0-NATSwitch" -SwitchType Internal

#Setting the IP address of the Virtual switch that will become the gateway address for any machines on the network
New-NetIPAddress -IPAddress 192.168.3.2 -PrefixLength 24 -InterfaceAlias "vEthernet (192.168.3.0-NATSwitch)"

#Setting the NAT network
New-NetNat -Name "192.168.3.0-NATNetwork" -InternalIPInterfaceAddressPrefix 192.168.3.0/24