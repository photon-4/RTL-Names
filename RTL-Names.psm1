$moduleRoot = $PSScriptRoot

. ([IO.Path]::Combine($PSScriptRoot, 'Format-RTLNames.ps1'))
. ([IO.Path]::Combine($PSScriptRoot, 'Get-RTLName.ps1'))
Update-FormatData -Prepend ([IO.Path]::Combine($moduleRoot, 'RTLNames.format.ps1xml'))
