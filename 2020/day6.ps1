$aocYear = "2020"
$aocDay = 6
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
    $groupAnswers = @()
    $form = $null
    $totalYes = 0
    foreach ($line in $inputData) {
        if ($line.Length -gt 0) {
            $form += $line.Replace("`n", "") + " "
        }
        else {
            $groupAnswers += $form
            $totalYes += ($form.Replace(" ", "").ToCharArray() | Sort-Object | Get-Unique).Count
            $form = $null
        }
    }
    Write-Host "The sum of all counts is $totalYes" -ForegroundColor Green

}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green

Write-Host "Part 2" -ForegroundColor Yellow

$timer = Measure-Command {
    $allAnswers = 0
    foreach ($form in $groupAnswers) {
        $line = $form.Trim().Split(" ")
        $matches = $line.ToCharArray() | Group | Where { $_.Name -in "a".."z" -and $_.Count -eq $line.Count }
        $allAnswers += $matches.Name.Count
    }
}
Write-Host "Found $allanswers answers"

Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green