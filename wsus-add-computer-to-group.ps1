$wsusserver = 'wsus'
#Load required assemblies           
[void][reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration")
$wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer($wsusserver,$False)

#Map group
$group = $wsus.GetComputerTargetGroups() | ? {$_.Name -eq "WinTime"}

# Assign clients
$client = $wsus.GetComputerTargetByName("computer-name.domain.com")
$group.AddComputerTarget($client)
