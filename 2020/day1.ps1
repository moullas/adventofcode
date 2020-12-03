$aocYear = "2020"
$aocDay = 1
$inputFile = "day1input.txt"
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 1" -ForegroundColor Yellow
[int[]]$inputData = Get-Content $inputFile
$breakPart = $false
$timer = Measure-Command {
    foreach ($i in $inputData) {
        if ($breakPart) { Break }
        foreach ($x in $inputData) {
            if (($i + $x) -eq $aocYear) {
                Write-Host "Factors are $i and $x"
                Write-Host "Product is $($i * $x)"    
                $breakPart = $true
            }
        }
    }
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"

Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 2" -ForegroundColor Yellow
$breakPart = $false
$timer = Measure-Command {
    foreach ($i in $inputData) {
        if ($breakPart) { Break }
        foreach ($x in $inputData) {
            if ($breakPart) { Break }
            foreach ($y in $inputData) {
                if (($i + $x + $y) -eq $aocYear) {
                    Write-Host "Factors are $i, $x and $y"
                    Write-Host "Product is $($i * $x * $y)"    
                    $breakPart = $true
                }
            }
        }
    }
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green