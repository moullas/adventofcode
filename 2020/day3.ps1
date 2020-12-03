$aocYear = "2020"
$aocDay = 3
$inputFile = "day$($aocDay)input.txt"
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
$inputData = Get-Content $inputFile
Write-Host "Loaded $($inputData.Count) entries..."
Write-Host "********************************************" -ForegroundColor Green
$VerbosePreference = "SilentlyContinue" #Change to Continue if you want to see more!
Function SlopeRide {
    Param(
        [int]$stepDown,
        [int]$stepRight,
        $inputData
    )

    $dataMapWidth = $inputData[0].Length
    $xPosition = 1
    $yPosition = 1
    $treesFound = 0
    for ($yPosition = $stepDown; $yPosition -le $inputData.Count - $stepDown; $yPosition += $stepDown) {
        $xPosition += $stepRight
        $currentLine = $inputData[$yPosition]
    
        if ($xPosition -gt ($dataMapWidth)) {
            $xPosition = ($xPosition % $dataMapWidth) 
        }
    
        $currentPos = $currentLine[$xPosition - 1]
        if ($currentPos -match "#") {
            $treesFound++
            Write-Verbose "$currentLine Y: $yPosition - X: $xPosition -C: $currentPos `t Trees: $treesFound `t FOUND A NEW ONE!"
        }
        else {
            Write-Verbose "$currentLine Y: $yPosition - X: $xPosition -C: $currentPos `t Trees: $treesFound"
        }  
    }
    Return $treesFound
}

Write-Host "Part 1" -ForegroundColor Yellow
$timer = Measure-Command {
    Write-Host "Found $(SlopeRide -stepDown 1 -stepRight 3 -inputData $inputData) trees in the slope!"
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"

Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 2" -ForegroundColor Yellow
$Trees = @()
$totalRuns = @(
    @{Description = "Slope 1"; StepDown = 1; StepRight = 1; InputData = $inputData }
    @{Description = "Slope 2"; StepDown = 1; StepRight = 3; InputData = $inputData }
    @{Description = "Slope 3"; StepDown = 1; StepRight = 5; InputData = $inputData }
    @{Description = "Slope 4"; StepDown = 1; StepRight = 7; InputData = $inputData }
    @{Description = "Slope 5"; StepDown = 2; StepRight = 1; InputData = $inputData }
)

$totalProduct = 0
$timer = Measure-Command {
foreach ($run in $totalRuns) {
    $result = SlopeRide -stepDown $run.StepDown -stepRight $run.StepRight -inputData $run.InputData
    $Trees += $result
    Write-Host "Found $result trees in $($run.Description)"
    if ($totalProduct -eq 0){ $totalProduct = $result }
    else { $totalProduct = $totalProduct * $result }
}
}
Write-Host "Product of all trees found in all slopes is $totalProduct"
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green