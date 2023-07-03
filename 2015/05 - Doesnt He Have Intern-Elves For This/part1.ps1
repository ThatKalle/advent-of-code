$aocInput = Get-Content -Path "input.txt"

$nicestrings = 0
$naughtystrings = 0

foreach ($String in $aocInput) {
    if (-not((($String | Select-String -Pattern "[aeiou]" -AllMatches).Matches.Count) -ge 3)) {
        Write-Host "$String is naughty."
        $naughtystrings++
        continue
    }
    if ($String -match "([a-z])\1") {
        if ($String -match "(ab|cd|pq|xy)") {
            Write-Host "$String is naughty."
            $naughtystrings++
            continue
        } else {
            Write-Host "$String is Nice!"
            $nicestrings++
            continue
        }
    } else {
        Write-Host "$String is naughty."
        $naughtystrings++
        continue
    }
}

Write-Host "Nice: $nicestrings, Naughty: $naughtystrings"
Write-Output -InputObject $nicestrings
