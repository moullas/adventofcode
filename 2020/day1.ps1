Set-Location $PSScriptRoot
# https://adventofcode.com/2020/day/1/input

[int[]]$inputData = Get-Content input.txt

Write-Host "Part 1"
$breakPart = $false
foreach ($i in $inputData){
    if ($breakPart){Break}
    foreach ($x in $inputData){
        if (($i+$x) -eq 2020){
            Write-Host "Factors are $i and $x"
            $Sum = $i * $x
            Write-Host "Multiplied Sum is $Sum"    
            $breakPart= $true
        }
    }
}

#Part 2
Write-Host "Part 2"
$breakPart = $false
foreach ($i in $inputData){
    if ($breakPart){Break}
    foreach ($x in $inputData){
        if ($breakPart){Break}
        foreach ($y in $inputData){
            if (($i+$x+$y) -eq 2020){
                Write-Host "Factors are $i , $x and $y"
                $Sum = $i * $x * $y
                Write-Host "Multiplied Sum is $Sum"    
                $breakPart= $true
            }
        }
        
    }
}