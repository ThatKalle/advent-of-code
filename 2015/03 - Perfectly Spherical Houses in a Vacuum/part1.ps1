$aocInput = Get-Content -Path "input.txt"

$housesvisited = @()
$result = 1
$xpos = 0
$ypos = 0
$housesvisited += "$xpos,$ypos"

$aocInput.ToCharArray() | ForEach-Object {
    switch ($_) {
        "^" {$ypos++}
        "v" {$ypos--}
        ">" {$xpos++}
        "<" {$xpos--}
    }
    $position = "$xpos,$ypos"

    if (-not($position -in $housesvisited)) {
        $housesvisited += $position
        $result++
    }
}

Write-Output -InputObject $result
