# maaran faili kust andmeid loen
$path = "output.txt"

# kontrollin kas fail on olemas
if (!(Test-Path $path)) {
    Write-Host "Faili output.txt ei leitud!"
    exit
}

# loen faili sisu ridade kaupa
$lines = Get-Content $path

# loon tyhja maatriksi
$matrix = @()

# tootlen iga rea eraldi
foreach ($line in $lines) {
    # jagan rea numbriteks ja muudan arvudeks
    $row = $line -split " " | ForEach-Object { [int]$_ }
    $matrix += ,$row
}

# naitan maatriksi konsoolis
Write-Host "Maatriks:"
foreach ($row in $matrix) {
    Write-Host ($row -join " ")
}

Write-Host ""
Write-Host "Rea summad:"

# arvutan iga rea summa
for ($i = 0; $i -lt $matrix.Count; $i++) {
    $sum = ($matrix[$i] | Measure-Object -Sum).Sum
    Write-Host "Rida $($i+1): $sum"
}

Write-Host ""
Write-Host "Veeru summad:"

# arvutan iga veeru summa
for ($j = 0; $j -lt $matrix[0].Count; $j++) {
    $colSum = 0
    for ($i = 0; $i -lt $matrix.Count; $i++) {
        $colSum += $matrix[$i][$j]
    }
    Write-Host "Veerg $($j+1): $colSum"
}

# koondan koik arvud uhte listi
$allNumbers = $matrix | ForEach-Object { $_ }

# leian suurima ja vaikseima arvu
$max = ($allNumbers | Measure-Object -Maximum).Maximum
$min = ($allNumbers | Measure-Object -Minimum).Minimum

Write-Host ""
Write-Host "Suurim number: $max"
Write-Host "Vaikseim number: $min"
