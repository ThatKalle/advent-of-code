$aocInput = Get-Content -Path "input.txt"
#$aocInput = Get-Content -Path "sample.txt"

$result = 0
$aocInput | ForEach-Object {
    $length,$width,$height = $_.Split("x")
    $side1 = ($length,$width,$height | Sort-Object)[0]
    $side2 = ($length,$width,$height | Sort-Object)[1]
    $bowlength = $length * $width * $height # volume
    $ribbonlength = (2 * $side1) + (2 * $side2)
    $totallength = $ribbonlength + $bowlength
    $result = $result + $totallength
}

Write-Output -InputObject $result
