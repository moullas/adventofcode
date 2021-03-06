$aocYear = "2020"
$aocDay = 8
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
    $linestried = @()
    $accumulator = $i = 0
    While ($i -notin $linestried) {
        $linestried += $i
        $instruction = $inputData[$i].Split(" ")[0]
        [int32]$value = $inputData[$i].Split(" ")[1]
        switch ($instruction) {
            "acc" {
                $accumulator += $value
                $i++ 
            }
            "nop" { $i++ }
            "jmp" { $i = $i + $value }
        }
        if ($i -in $linestried) {
            Write-Host "Next instruction: $instruction $value |`t$i"
        }
    }
    Write-Host "Accumulator Value: $accumulator" -ForegroundColor Green
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
    Write-Host "********************************************" -ForegroundColor Green
    Write-Host "Part 2" -ForegroundColor Yellow
    
    $linestried = @()
    $accumulator = $i = 0
    While ($i -le $inputData.Count) {
        $linestried += $i
        if ($i = 518){$i = 519}
        $instruction = $inputData[$i].Split(" ")[0]
        [int32]$value = $inputData[$i].Split(" ")[1]
        if ($i -in $linestried) {
            Write-Host "Instruction: $instruction `t $value |`t$i"
            if ($instruction -eq "jmp"){$instruction = "nop"}
            elseif ($instruction -eq "nop"){$instruction = "jmp"}
        }
        switch ($instruction) {
            "acc" {
                $accumulator += $value
                $i++ 
            }
            "nop" { $i++ }
            "jmp" { $i = $i + $value }
        }
        
    }
    #>











<#
Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 2" -ForegroundColor Yellow
$timer = Measure-Command {
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green
#>