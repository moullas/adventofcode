$aocYear = "2020"
$aocDay = 10
$inputFile = "day$($aocDay)input.txt"
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
$inputData = [int[]](Get-Content $inputFile) | Sort-Object
Write-Host "Loaded $($inputData.Count) entries..."
Write-Host "********************************************" -ForegroundColor Green

Write-Host "Part 1" -ForegroundColor Yellow
$timer = Measure-Command {
    $jolt1Diff = 0
    $jolt3Diff = 1
    $CurrentJolt = 0
    foreach ($i in $inputData) {
        Switch ($i - $CurrentJolt) {
            1 {
                $CurrentJolt = $i
                $jolt1Diff++
            }
            2 { $CurrentJolt = $i }
            3 {
                $CurrentJolt = $i
                $jolt3Diff++
            }
        }
    }

    Write-Host "Found $jolt1diff 1-Jolt Differences and $jolt3diff 3-Jolt Differences" -ForegroundColor Yellow
    Write-Host "Answer is $($jolt1diff * $jolt3diff)" -ForegroundColor Green
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"



Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 2" -ForegroundColor Yellow
$timer = Measure-Command {
    Function FindCombos{
        Param(
            $inputRange,
            $step
        )
        
        Write-Host $inputRange
        $distinct = $true
        for ($i = $start;$i -lt $inputRange.Count;$i++){
            #if ($inputRange)
        }
        
    }
}
FindCombos $inputData 0
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green
