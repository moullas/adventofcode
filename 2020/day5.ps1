$aocYear = "2020"
$aocDay = 5
$inputFile = "day$($aocDay)input.txt"
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
$inputData = Get-Content $inputFile
Write-Host "Loaded $($inputData.Count) entries..."
Write-Host "********************************************" -ForegroundColor Green

Write-Host "Part 1" -ForegroundColor Yellow
Function EvaluateSeat {
    Param(
        [String]$boardingPass
    )
    $seatId = 0..([math]::Pow(2, $boardingPass.Length) - 1)
    $start = 0
    $end = 0
    for ($i = 0; $i -lt $boardingPass.Length; $i++) {
        if ($boardingPass[$i] -eq "R" -or $boardingPass[$i] -eq "B") {
            $start = $seatId[$seatId.Count / 2]
            $end = $seatId[$seatId.Count - 1]
        }
        elseif ($boardingPass[$i] -eq "L" -or $boardingPass[$i] -eq "F" ) {
            $start = $seatId[0]
            $end = $seatId[$seatId.Count / 2 - 1]
        }
        $seatId = $start..$end
    }
    return $seatId
}

$timer = Measure-Command {
    $seats = @()
    foreach ($line in $inputData) {
        $row = $line.substring(0, 7)
        $column = $line.substring(7, 3)
        $rowNumber = EvaluateSeat -boardingPass $row
        $columnNumber = EvaluateSeat -boardingPass $column
        $seatId = $rowNumber * 8 + $columnNumber
        $seats += $seatId
        Write-Verbose "Boarding Pass : $line `t Seat ID: $seatId `t Row: $rowNumber `t Column: $columnNumber"
    
    }
    $MaximumSeat = ($seats | Measure-Object -Maximum).Maximum
    Write-Host "Highest Seat ID is $MaximumSeat" -ForegroundColor Green
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"

Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 2" -ForegroundColor Yellow
$timer = Measure-Command {

    for ($i = 0; $i -lt 128; $i++) {
        for ($j = 0; $j -lt 8; $j++) {
            $seatId = $i * 8 + $j
            if ($seats -notcontains $seatId -and $seats -contains ($seatId - 1) -and $seats -contains ($seatId + 1) ) {
                Write-Host "Your seat is $seatId" -ForegroundColor Green
            }               
        }
    }
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green


