$aocInput = Get-Content -Path "input.txt"

$nicestrings = 0
$naughtystrings = 0

foreach ($String in $aocInput) {
    $match1 = $String | Select-String -Pattern "([a-z][a-z]).*\1" -AllMatches
    $match2 = $String | Select-String -Pattern "([a-z]).\1" -AllMatches
    if ($match1 -and $match2) {
        Write-Host "$String is Nice!"
        $nicestrings++
        continue
    } else {
        Write-Host "$String is naughty."
        $naughtystrings++
        continue
    }
}

Write-Host "Nice: $nicestrings, Naughty: $naughtystrings"
Write-Output -InputObject $nicestrings
