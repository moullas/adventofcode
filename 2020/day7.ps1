$aocYear = "2020"
$aocDay = 7
$inputFile = "day$($aocDay)input.txt"
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
$inputData = Get-Content $inputFile
Write-Host "Loaded $($inputData.Count) entries..."
Write-Host "********************************************" -ForegroundColor Green

Write-Host "Part 1" -ForegroundColor Yellow

$WhatDoIWantItToBe = "shiny gold"
$AllBags = @()
$CanContain = @()
$timer = Measure-Command {
    #$inputData = "clear indigo bags contain 4 shiny gold bags, 4 bright blue bags."
#Build object of ALL bags
foreach ($line in $inputData){
    [String]$bag = $line.Split(" bags contain ")[0].Trim()
    $containedbags = $line.Split(" bags contain ")[1].Split(",").Trim(".").Trim("bags").Trim()
    $bags = @()
    foreach ($containedbag in $containedBags){
        $bags += [PSCustomObject]@{
            Source = $bag
            Qty = $containedbag.Split(" ")[0];
            Color = ($containedbag.Split(" ")[1] + " " + $containedbag.Split(" ")[2]).Trim()
        }
    }
    $AllBags += $bags
}
<#
$CanContain = ($AllBags | Where {$WhatDoIWantItToBe -in $_.Color}).Source
foreach ($sourceColor in $CanContain){
    Write-Host $sourceColor
    Write-Host ($AllBags | Where {$sourceColor.Trim() -in $_.Color}).Source
}
#>
$global:total
Function GetBags(){
    Param(
        $ColorToMatch,
        $inputBags
    )
    $returnBags = ($inputBags | Where {$ColorToMatch -in $_.Color}).Source
    if ($returnBags.Count -ge 0){
        $global:total +=$returnBags.Count
        foreach ($bag in $returnBags){
            Write-Host $bag
            GetBags -ColorToMatch $bag -inputBags $inputBags
        }
    }
    else{
        Write-Host $returnedbags.count
    }
}
GetBags -ColorToMatch $WhatDoIWantItToBe -inputBags $AllBags











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