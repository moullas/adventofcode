$aocYear = "2020"
$aocDay = 2
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
#https://adventofcode.com/2020/day/2/input

$inputData = Get-Content day2input.txt


{
    $data = ($inputData[0].Replace(":","")).Replace("-"," ").Split(" ")
    Write-Host "Pass Low $($data[0])"
    Write-Host "Pass High $($data[1])"
    Write-Host "Pass Char $($data[2])"
    Write-Host "Pass String $($data[3])"
}