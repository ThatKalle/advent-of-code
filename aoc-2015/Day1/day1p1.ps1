# --- Day 1: Not Quite Lisp ---

# Read in input from AOC
$aocInput = Get-Content -Path "input.txt"

$SortedGroup = $aocInput.ToCharArray() | Group-Object | Sort-Object -Descending -Property Count

$result = $SortedGroup[0].Count - $SortedGroup[1].Count

Write-Output -InputObject $result