$aocYear = "2020"
$aocDay = 4
$inputFile = "day$($aocDay)input.txt"
Set-Location $PSScriptRoot
Write-Host "********************************************" -ForegroundColor Green
Write-Host "* Advent of Code $aocYear - Solution for Day $aocDay *" -ForegroundColor Yellow
Write-Host "********************************************" -ForegroundColor Green
$inputData = Get-Content $inputFile
Write-Host "Loaded $($inputData.Count) entries..."
Write-Host "********************************************" -ForegroundColor Green

Function CheckPassport {
    Param(
        $map,
        $validateFields
    )
    $fields = @(
        @{Description = "Birth Year"; Name = "byr"; Optional = $false; ValidationRule = "\b(19[2-8][0-9]|199[0-9]|200[0-2])\b" }
        @{Description = "Issue Year"; Name = "iyr"; Optional = $false; ValidationRule = "\b(201[0-9]|2020)\b" }
        @{Description = "Expiration Year"; Name = "eyr"; Optional = $false; ValidationRule = "\b(202[0-9]|2030)\b" }
        @{Description = "Height"; Name = "hgt"; Optional = $false; ValidationRule = "^(1[5-8][0-9]|19[0-3])cm$|^(59|6[0-9]|7[0-6])in$" }
        @{Description = "Hair Color"; Name = "hcl"; Optional = $false; ValidationRule = "^#[0-9A-Fa-f]{6}\b" }
        @{Description = "Eye Color"; Name = "ecl"; Optional = $false; ValidationRule = "^(amb|blu|brn|gry|grn|hzl|oth)$" }
        @{Description = "Passport ID"; Name = "pid"; Optional = $false; ValidationRule = "^(\d{9})$" }
        @{Description = "Country ID"; Name = "cid"; Optional = $true; ValidationRule = "" }
    )
    $valid = $true
    foreach ($field in $fields) {
        if ($null -eq $map.$($field.Name) -and ($field.Optional -eq $false)) {
            $valid = $false
            break
        }
        if ($validateFields -and !$field.Optional) {
            Write-Verbose "Validate: $($field.Name) `t $($map.$($field.Name)) `t`t $($field.ValidationRule)"
            if (!($($map.$($field.Name)) -match $field.ValidationRule)) {
                Write-Verbose "Validation Rule not matched on $($field.Name)"
                
                $valid = $false
                break
            }        
        }
    }
    Return $valid
}

$pass = $null
$passports = $null
$passports = @()

foreach ($line in $inputData) {    
    if ($line.Length -gt 0) {
        $pass += $line.Replace("`n", "") + " "
    }
    else {
        $passports += $pass
        $passCount++
        $pass = $null
    }
}
$validPassports = 0
Write-Host "Loaded $($passports.Count) passports to process" -ForegroundColor Green
$timer = Measure-Command {
Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 1" -ForegroundColor Yellow
foreach ($passport in $passports) {
    $map = $passport.Split(" ") | ConvertFrom-StringData -Delimiter ":"
    $validPassport = CheckPassport -map $map -validateFields $false
    If ($validPassport) { $validPassports++ }
}
Write-Host "Found $validPassports valid Passports" -ForegroundColor Green
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"

Write-Host "********************************************" -ForegroundColor Green
Write-Host "Part 2" -ForegroundColor Yellow
$validPassports = 0
$timer = Measure-Command {
    foreach ($passport in $passports) {
        $map = $passport.Split(" ") | ConvertFrom-StringData -Delimiter ":"
        $validPassport = CheckPassport -map $map -validateFields $true
        If ($validPassport) { $validPassports++ }
    }
    Write-Host "Found $validPassports valid Passports" -ForegroundColor Green
}
Write-Host "Elapsed time $([math]::Round($timer.TotalMilliseconds)) milliseconds"
Write-Host "********************************************" -ForegroundColor Green