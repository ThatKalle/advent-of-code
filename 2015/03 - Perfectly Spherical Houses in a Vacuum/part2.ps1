$aocInput = Get-Content -Path "input.txt"

$housesvisited = @()
$result = 1
$i = 1
$housesvisited += "0,0"

$santaposition = "0,0"
$robostanapostion = "0,0"

function Move-Stanta {
    param(
        $CurrentPosition,
        $Move
    )

    [int]$xpos,[int]$ypos = $CurrentPosition.Split(',')

    switch ($Move) {
        "^" {$ypos++}
        "v" {$ypos--}
        ">" {$xpos++}
        "<" {$xpos--}
    }

    $result = "$xpos,$ypos"
    Write-Output -InputObject $result
}

$aocInput.ToCharArray() | ForEach-Object {
    if ($i % 2 -eq 1) {
        $position = Move-Stanta -CurrentPosition $santaposition -Move $_
        $santaposition = $position
    } else {
        $position = Move-Stanta -CurrentPosition $robostanapostion -Move $_
        $robostanapostion = $position
    }

    if (-not($position -in $housesvisited)) {
        $housesvisited += $position
        $result++
    }
    $i++
}

Write-Output -InputObject $result
