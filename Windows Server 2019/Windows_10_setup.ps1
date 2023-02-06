# Setting DNS
Set-DnsClientServerAddress -InterfaceAlias ethernet -ServerAddresses ("192.168.3.10")

# Adding the device to Domain and changing its name
Add-Computer -NewName mydesktop -DomainName company.pri -Restart

# Adding Active Directory Users and Computers console 
Add-WindowsCapability -Online -Name ServerCore.AppCompatibility~~~~0.0.1.0

# Adding all of the RSAT tools
Get-WindowsCapability -online | where name -like Rsat* | Add-WindowsCapability -Online