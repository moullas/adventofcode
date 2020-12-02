$aocYear = "2020"
$aocDay = 1
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
# https://adventofcode.com/2020/day/1/input
[int[]]$inputData = Get-Content input.txt

Write-Host "Part 1" -ForegroundColor Yellow
$breakPart = $false
foreach ($i in $inputData){
    if ($breakPart){Break}
    foreach ($x in $inputData){
        if (($i+$x) -eq 2020){
            Write-Host "Factors are $i and $x"
            $Sum = $i * $x
            Write-Host "Multiplied Sum is $Sum"    
            $breakPart= $true
        }
    }
}
Write-Host "********************************************" -ForegroundColor Green
#Part 2
Write-Host "Part 2" -ForegroundColor Yellow
$breakPart = $false
foreach ($i in $inputData){
    if ($breakPart){Break}
    foreach ($x in $inputData){
        if ($breakPart){Break}
        foreach ($y in $inputData){
            if (($i+$x+$y) -eq 2020){
                Write-Host "Factors are $i , $x and $y"
                $Sum = $i * $x * $y
                Write-Host "Multiplied Sum is $Sum"    
                $breakPart= $true
            }
        }
        
    }
}
Write-Host "********************************************" -ForegroundColor Green