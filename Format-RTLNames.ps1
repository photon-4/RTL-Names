
function Format-RTLNames {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [OutputType([string])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.IO.FileSystemInfo]$FileInfo
    )

    process {
        $name = ""
        $IsTerminalIconsLoaded = get-module -Name "Terminal-Icons"
        if ($IsTerminalIconsLoaded) {
            $TerminalIconsFormattedName = Format-TerminalIcons $FileInfo
            $name = Get-RTLName $TerminalIconsFormattedName
        }
        else {
            $name = Get-RTLName $FileInfo.Name
        }
        
        $name
    }
}