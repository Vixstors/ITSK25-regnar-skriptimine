$path = "output.txt"

if (!(Test-Path $path)) {
    Write-Host "Faili output.txt ei leitud!"
    exit
}

$lines = Get-Content $path
$matrix = @()

foreach ($line in $lines) {
    $row = $line -split " " | ForEach-Object { [int]$_ }
    $matrix += ,$row
}

Write-Host "Maatriks:"
foreach ($row in $matrix) {
    Write-Host ($row -join " ")
}

Write-Host ""
Write-Host "Rea summad:"

for ($i = 0; $i -lt $matrix.Count; $i++) {
    $sum = ($matrix[$i] | Measure-Object -Sum).Sum
    Write-Host "Rida $($i+1): $sum"
}

Write-Host ""
Write-Host "Veeru summad:"

for ($j = 0; $j -lt $matrix[0].Count; $j++) {
    $colSum = 0
    for ($i = 0; $i -lt $matrix.Count; $i++) {
        $colSum += $matrix[$i][$j]
    }
    Write-Host "Veerg $($j+1): $colSum"
}

$allNumbers = $matrix | ForEach-Object { $_ }
$max = ($allNumbers | Measure-Object -Maximum).Maximum
$min = ($allNumbers | Measure-Object -Minimum).Minimum

Write-Host ""
Write-Host "Suurim number: $max"
Write-Host "Vaikseim number: $min"
