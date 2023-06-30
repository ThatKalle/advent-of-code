$aocInput = Get-Content -Path "input.txt"
#$aocInput = Get-Content -Path "sample.txt"

$SortedGroup = $aocInput.ToCharArray() | Group-Object | Sort-Object -Descending -Property Count

$result = $SortedGroup[0].Count - $SortedGroup[1].Count

Write-Output -InputObject $result