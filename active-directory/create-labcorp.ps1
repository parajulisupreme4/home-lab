# Creates the LabCorp OU structure, security groups and users in lab.local
# Run on DC01 in an elevated PowerShell session

$domain = "DC=lab,DC=local"
$pw = Read-Host "Initial password for new users" -AsSecureString

# OU structure
New-ADOrganizationalUnit -Name "LabCorp" -Path $domain
"Users","Computers","Groups" | ForEach-Object { New-ADOrganizationalUnit -Name $_ -Path "OU=LabCorp,$domain" }
"IT","Sales","HR" | ForEach-Object { New-ADOrganizationalUnit -Name $_ -Path "OU=Users,OU=LabCorp,$domain" }

# Security groups
"IT","Sales","HR" | ForEach-Object {
    New-ADGroup -Name "GRP-$_" -GroupScope Global -GroupCategory Security -Path "OU=Groups,OU=LabCorp,$domain"
}

# Users
$users = @(
    @{First="Alice"; Last="Nguyen"; Dept="IT"},
    @{First="Ben";   Last="Carter"; Dept="IT"},
    @{First="Chloe"; Last="Smith";  Dept="Sales"},
    @{First="David"; Last="Lee";    Dept="Sales"},
    @{First="Emma";  Last="Brown";  Dept="HR"},
    @{First="Frank"; Last="Wilson"; Dept="HR"}
)

foreach ($u in $users) {
    $sam = ($u.First.Substring(0,1) + $u.Last).ToLower()
    New-ADUser -Name "$($u.First) $($u.Last)" -GivenName $u.First -Surname $u.Last `
        -SamAccountName $sam -UserPrincipalName "$sam@lab.local" -Department $u.Dept `
        -Path "OU=$($u.Dept),OU=Users,OU=LabCorp,$domain" `
        -AccountPassword $pw -Enabled $true -ChangePasswordAtLogon $true
    Add-ADGroupMember -Identity "GRP-$($u.Dept)" -Members $sam
}

Get-ADUser -Filter * -SearchBase "OU=LabCorp,$domain" | Select Name, SamAccountName
