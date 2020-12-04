$aocYear = "2020"
$aocDay = 4
$inputFile = "day$($aocDay)input.txt"
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
#$inputData = (Get-Content $inputFile -Raw) -split "`n`n" -replace " ","`n"
$inputData = Get-Content $inputFile
Write-Host "Loaded $($inputData.Count) entries..."
Write-Host "********************************************" -ForegroundColor Green

Write-Host "Part 1" -ForegroundColor Yellow

$timer = Measure-Command {
$pass = $null
$passports = $null
$passports = $null
$pass = @()
$passcount = 1
foreach ($line in $inputData){
    if ($line.Length -gt 0) {
        $empty = "No"
        $pass += $line.Replace("`n","") + " "
        #Write-Host $pass -ForegroundColor Yellow
    }
    else{
        $empty = "Yes"
        $passports += $pass
        Write-Host "Passport: $pass" -ForegroundColor Green
        $pass = $null
    }
    #Write-Host "Empty: $empty | $pass"
}

Write-Host "Found $($passports.Count) passports, should be $passcount" -ForegroundColor Green
foreach ($passport in $passports){
    #Write-Host $passport
}


}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"

<#
Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 2" -ForegroundColor Yellow
$timer = Measure-Command {
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green
#>