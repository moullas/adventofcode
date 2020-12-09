$aocYear = "2020"
$aocDay = 9
$inputFile = "day$($aocDay)input.txt"
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
#[int64[]]$inputData = Get-Content $inputFile
$inputData = Get-Content $inputFile
Write-Host "Loaded $($inputData.Count) entries..."
Write-Host "********************************************" -ForegroundColor Green

Write-Host "Part 1" -ForegroundColor Yellow

$timer = Measure-Command {
    $preamble = 25
    $breakvalue = 0
    for ($i = $preamble; $i -lt $inputData.Count; $i++) {
        $found = $false
        [int64]$value = $inputData[$i]
        $Start = $i - $preamble
        $End = $i - 1
        for ($j = $Start; $j -le $End; $j++){
            for ($k = $j+1; $k -le $End; $k++){
                if ($value -eq ([int64]$inputdata[$j] + [int64]$inputdata[$k])){
                    #Write-Host "Position: $i Value: $value `t $([int64]$inputdata[$j]) + $([int64]$inputdata[$k])"
                    $found = $true                    
                }
                if ($found){break}
            }
            if ($found){break}
        }
        if (!$found){
            $breakvalue = $value
            
            break
        }
    }
    Write-Host "Position: $i Value: $breakvalue - NO MATCH FOUND" -ForegroundColor Red
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"

Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 2" -ForegroundColor Yellow
$timer = Measure-Command {

#i = 1 -> go through 2 consecutive
#i = 2 -> go through 3 consecutive
#i = 3 -> go through 4 consecutive (and so on.)






}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green
#>