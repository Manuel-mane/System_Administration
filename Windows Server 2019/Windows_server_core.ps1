# Setting my Windows Server Core

# Setting timezone:
tzutil /l # displays the available names for timezones
set-timezone "Eastern Standard Time"

# Check date
get-date
set-date -date "2/5/2023 10:40 AM" #set a new date

# Setting Network Interface

Get-NetIPAddress -InterfaceAlias Ethernet  #Obtain information of current IP configuration
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.3.10 -PrefixLength 24 -DefaultGateway 192.168.3.2

Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddress ("192.168.3.10") # in this case I will set this server as the DNS server

# Enable remoting to the machine
Enable-PSRemoting

# Setting general firewall rules
New-NetFirewallRule -displayname "Allow All Traffic" -direction outbound -action allow
New-NetFirewallRule -displayname "Allow All Traffic" -direction inbound -action allow

# Installing the Active Directory feature
Install-WindowsFeature –Name "AD-Domain-Services" –IncludeManagementTools

# Installing DNS and configuring this machine as the first AD controller
Install-ADDSForest -DomainName "company.pri" -InstallDNS

