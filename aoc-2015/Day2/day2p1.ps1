# --- Day 2: I Was Told There Would Be No Math ---

# Read in input from AOC
$aocInput = Get-Content -Path "input.txt"

$result = 0
$aocInput | ForEach-Object {
    $length,$width,$height = $_.Split("x")
    $surface1 = $length * $width
    $surface2 = $width * $height
    $surface3 = $height * $length
    $smallest = ($surface1,$surface2,$surface3 | Sort-Object)[0]
    $sizeofpaper = 2 * $surface1 + 2 * $surface2 + 2 * $surface3 + $smallest
    $result = $result + $sizeofpaper
}

Write-Output -InputObject $result
