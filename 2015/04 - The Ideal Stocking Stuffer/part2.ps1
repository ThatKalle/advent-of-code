function Get-StringHash {
    <#
    .SYNOPSIS
    Converts string to MD5 Hash

    .PARAMETER String
    Defines the input string to convert to MD5 Hash

    .OUTPUTS
    System.String.

    .EXAMPLE
    PS> Get-StringHash -String "abcdef"
    E8-0B-50-17-09-89-50-FC-58-AA-D8-3C-8C-14-97-8E
    #>
    param(
        [Parameter(Mandatory=$true)]
        [string]$String
    )

    begin {
        $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
        $utf8 = New-Object -TypeName System.Text.UTF8Encoding
    }

    process {
        [string]$result = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($String)))
    }

    end {
        Write-Output -InputObject $result
    }
}

$aocInput = Get-Content -Path "input.txt"

$hashFound = $false
$i = 1

while (-not($hashFound)) {
    $key = ($aocInput + $i).ToString()

    $hash = Get-StringHash -String $key
    if ($hash.StartsWith('00-00-00')) {
        $result = $i
        $hashFound = $true
        Write-Host "$key resulted in an MD5 Hash $hash"
    }

    $i++
}

Write-Output -InputObject $result
