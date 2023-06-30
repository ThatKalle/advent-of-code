# --- Day 1: Not Quite Lisp --- --- Part Two ---

# Read in input from AOC
$aocInput = Get-Content -Path "input.txt"

$CurrentFloor = 0
$position = 1
$aocInput.ToCharArray() | ForEach-Object {
    switch($_) {
        "(" {
            $CurrentFloor++
        }
        ")" {
            $CurrentFloor--
        }
    }

    if ($CurrentFloor -eq -1) {
        $result = $position
        break
    }
    $position++
}

Write-Output -InputObject $result