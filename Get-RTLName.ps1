
function Get-RTLName {
  
    [OutputType([string])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [String]$OriginalName
    )

    process {
        $IsArabic = $OriginalName -match "\p{IsArabic}"
        if (!$IsArabic) {
            $OriginalName
            return
        }
        $result = ""
        $charArray = $OriginalName.ToCharArray()
        
        $CurrentWord = [char[]]""
        foreach ($char in $charArray) {
            if ($char -match "\p{IsArabic}") {
                
                $CurrentWord = $CurrentWord + $char
            }
            else {
               
                if ($CurrentWord.Count -gt 0) {
                    [array]::Reverse($CurrentWord)
                    $result = $result + (-join $CurrentWord)
                    $CurrentWord = [char[]]""
                }
                $result = $result + $char
            }

        }
        if ($CurrentWord.Count -gt 0) {
            [array]::Reverse($CurrentWord)
            $result = $result + (-join $CurrentWord)
            $CurrentWord = [char[]]""
        }
        $result
        return
       
    }
}