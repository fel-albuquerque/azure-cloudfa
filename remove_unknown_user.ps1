$OBJTYPE = "Unknown"
#Find Azure RBAC Role Assignments of 'Unknown' Type
$RAUNKNOWN =  Get-AzRoleAssignment | where-object {$_.ObjectType.Equals($OBJTYPE)}
#Remove each 'Unknown' Type Azure Role Assignment
$RAUNKNOWN | ForEach-Object {
$object = $_.ObjectId
$roledef = $_.RoleDefinitionName
$rolescope = $_.Scope
Remove-AzRoleAssignment -ObjectId $object -RoleDefinitionName $roledef -Scope $rolescope
}
