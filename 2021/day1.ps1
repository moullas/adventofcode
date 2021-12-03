$aocYear = "2021"
$aocDay = 1
$inputFile = "day$($aocDay)input.txt"
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
$inputData = Get-Content $inputFile
Write-Host "Loaded $($inputData.Count) entries..."
Write-Host "********************************************" -ForegroundColor Green

Write-Host "Part 1" -ForegroundColor Yellow

$timer = Measure-Command {
    [int32]$startMeasurement = $inputData[0]
    $increaseCount = 0
    $originalForeground = $host.ui.RawUI.ForegroundColor
    foreach ($measurement in $inputData) {
        if ([Int32]$measurement -gt [int32]$startMeasurement) {
            
            $increaseCount++
            #$host.ui.RawUI.ForegroundColor = "Green"
            #Write-Host "$measurement (increased) `t $increaseCount"
        }
        else {
            #$host.ui.RawUI.ForegroundColor = "Red"
            #Write-Host "$measurement (decreased)"
        }
        $startMeasurement = $measurement
    }
    $host.ui.RawUI.ForegroundColor = $originalForeground
    Write-Host "$increaseCount are larger than previous measurements"
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"


Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 2" -ForegroundColor Yellow
$timer = Measure-Command {
    $increaseCount = 0
    [int32]$startMeasurement = [int32]$inputData[0] + [int32]$inputData[1] + [int32]$inputData[2]
    for (($i = 0); $i -lt ($inputData.Count - 2); $i++) {
        [int32]$measurement = [int32]$inputData[$i] + [int32]$inputData[$i + 1] + [int32]$inputData[$i + 2]
        if ([int32]$measurement -gt [int32]$startMeasurement) {
            
            $increaseCount++
            #$host.ui.RawUI.ForegroundColor = "Green"
            #Write-Host "$measurement (increased) `t $increaseCount"
        }
        else {
            #$host.ui.RawUI.ForegroundColor = "Red"
            #Write-Host "$measurement (decreased)"
        }
        $startMeasurement = $measurement
    }
    $host.ui.RawUI.ForegroundColor = $originalForeground
    Write-Host "$increaseCount are larger than previous measurements"
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green