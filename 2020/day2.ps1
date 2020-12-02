$aocYear = "2020"
$aocDay = 2
$inputFile = "day2input.txt"
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
$inputData = Get-Content $inputFile
Write-Host "Loaded $($inputData.Count) entries..."
Write-Host "********************************************" -ForegroundColor Green

Write-Host "Part 1" -ForegroundColor Yellow
$validPasswords = 0
$timer = Measure-Command {
    foreach ($dataLine in $inputData) {
        $resultCount = 0
        $data = ($dataLine.Replace(":", "")).Replace("-", " ").Split(" ")
        $resultCount = ($data[3] | Select-String -Pattern $data[2] -AllMatches).Matches.Count
        if (($resultCount -ge [int]$data[0]) -and ($resultCount -le [int]$data[1])) {
            $validPasswords++
        }
    }
}
Write-Host "Found $validPasswords valid passwords in $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green

Write-Host "Part 2" -ForegroundColor Yellow
$validPasswords = 0
$timer = Measure-Command {
    foreach ($dataLine in $inputData) {
        $resultCount = 0
        $data = ($dataLine.Replace(":", "")).Replace("-", " ").Split(" ")
        $passPos1 = [int]($data[0]) - 1 #-1 to account for non index-zero
        $passPos2 = [int]($data[1]) - 1
        $pass = $data[3]
        if (($pass.Substring($passPos1, 1) -eq $data[2]) -xor ($pass.Substring($passPos2, 1) -eq $data[2])) { $validPasswords++ }
    }
}
Write-Host "Found $validPasswords valid passwords in $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green