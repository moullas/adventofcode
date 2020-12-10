$aocYear = "2020"
$aocDay = 9
$inputFile = "day$($aocDay)input.txt"
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
[int64[]]$inputData = Get-Content $inputFile
$inputData = Get-Content $inputFile
Write-Host "Loaded $($inputData.Count) entries..."
Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 1" -ForegroundColor Yellow
$timer = Measure-Command {
    $preamble = 25
    $breakvalue = 0

    for ($i = $preamble; $i -lt $inputData.Count; $i++) {
        $found = $false
        for ($j = $i - $preamble; $j -le $i - 1; $j++) {
            for ($k = $j + 1; $k -le $i - 1; $k++) {
                if ($inputData[$i] -eq ($inputdata[$j] + $inputdata[$k])) {
                    Write-Host "Position: $i Values: $value `t $([int64]$inputdata[$j]) + $([int64]$inputdata[$k])" -ForegroundColor Yellow
                    $found = $true                    
                }
                if ($found) { break }
            }
            if ($found) { break }
        }
        if (!$found) {
            $breakvalue = $inputData[$i]
            break
        }
    }
    Write-Host "Position: $i Value: `t $breakvalue - Glitch in the Matrix" -ForegroundColor Green
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"

Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 2" -ForegroundColor Yellow
Function CheckRange {
    Param(
        $stepCount,
        [int64[]]$inputRange,
        $checkValue
    )
    $found = $false
    $inputRange
    Write-Host "Step: $stepCount. Evaluating against $checkValue"
    for ($i = $stepCount; $i -lt $inputRange.Count; $i++) {
        [int64]$sum = 0
        $inputRange[($i - $stepcount)..$i] | ForEach-Object { $sum += $_ }
        if ($sum -eq $checkValue) {
            $found = $true
            Write-Host "Found match at position $i, Evaluated Range: $stepCount" -ForegroundColor Yellow
            [int64[]]$finalArray = $inputRange[($i - $stepcount)..$i]
            $finalArray = $finalArray | Sort-Object
            [int64]$result = $finalArray[0] + $finalArray[$stepCount]
            Write-Host "Result $result" -ForegroundColor Green
            Return $result
            #Break
        }
    }
    if (!$found) {      
        $result = CheckRange -stepCount ($stepCount + 1) -inputRange $inputRange -checkValue $checkValue
    }
    return $result
}

$timer = Measure-Command {
    CheckRange -stepCount 1 -inputRange $inputData -checkValue $breakvalue
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green