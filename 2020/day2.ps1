$aocYear = "2020"
$aocDay = 2
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
#https://adventofcode.com/2020/day/2/input

$inputData = Get-Content day2input.txt
Write-Host "Loaded $($inputData.Count) entries"
$validPasswords = 0
Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 1" -ForegroundColor Yellow
foreach ($dataLine in $inputData){
    $resultCount = 0
    $data = ($dataLine.Replace(":","")).Replace("-"," ").Split(" ")
    [int]$passLow = $data[0]
    [int]$passHigh = $data[1]
    $pass = $data[3]
    $result = $pass | Select-String -Pattern $data[2] -AllMatches
    $resultCount = $result.Matches.Count
    if (($resultCount -ge $passLow) -and ($resultCount -le $passHigh)){
        $validPasswords++
    }
}
Write-Host "Valid Passwords Found: $validPasswords"
Write-Host "********************************************" -ForegroundColor Green

Write-Host "Part 2" -ForegroundColor Yellow
$validPasswords = 0
foreach ($dataLine in $inputData){
    $resultCount = 0
    $data = ($dataLine.Replace(":","")).Replace("-"," ").Split(" ")
    $passPos1 = [int]($data[0]) - 1 #-1 to account for non index-zero
    $passPos2 = [int]($data[1]) - 1
    $pass = $data[3]
    $result1 = $pass.Substring($passPos1,1) -eq $data[2]
    $result2 = $pass.Substring($passPos2,1) -eq $data[2]

    if ($result1 -xor $result2){
        $validPasswords++
    }
}
Write-Host "Valid Passwords Found: $validPasswords"
Write-Host "********************************************" -ForegroundColor Green