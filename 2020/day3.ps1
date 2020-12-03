Clear-Host
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
$dataMapWidth = $inputData[0].Length
$stepDown = 1
$stepRight = 3
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
        Write-Host "$currentLine Y: $yPosition - X: $xPosition -C: $currentPos `t Trees: $treesFound `t FOUND A NEW ONE!" -ForegroundColor Green
    }
    else {
        Write-Host "$currentLine Y: $yPosition - X: $xPosition -C: $currentPos `t Trees: $treesFound" -ForegroundColor Yellow
    }
    
    if ($null -eq $currentPos) { 
        
        $i = 0
        $currentLine.Length
        for ($i = 0; $i -le $currentLine.Length; $i++) {
            Write-Host "$i `t $($currentLine[$i-1])"
        
        }
        Write-Host "PROB" -ForegroundColor Red 
    
    }
    if ($yPosition -eq 0) { Write-Host "PROB" -ForegroundColor Red }
    #Write-Host "$currentLine Y: $yPosition - X: $xPosition `t Trees Found: $treesFound"

    <#
    $i = 0
    $currentLine.Length
    for ($i=0; $i -le $currentLine.Length; $i++){
        Write-Host "$i `t $($currentLine[$i-1])"
        
    }
    #>
    
}
Write-Host "Found $treesfound trees in the slope!"
