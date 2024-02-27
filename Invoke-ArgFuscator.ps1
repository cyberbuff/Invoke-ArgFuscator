Import-Module ./Invoke-CommandLineObfuscation.psm1

$n_default = 1
if($args.Length -eq 0){
    Write-Host "█ █▄░█ █░█ █▀█ █▄▀ █▀▀ ▄▄" -NoNewline
    Write-Host " █▀▀ █▀█ █▀▄▀█ █▀▄▀█ ▄▀█ █▄░█ █▀▄ " -NoNewline -f Blue
    Write-Host "█░░ █ █▄░█ █▀▀ " -NoNewline -f DarkGray
    Write-Host "█▀█ █▄▄ █▀▀ █░█ █▀ █▀▀ ▄▀█ ▀█▀ █ █▀█ █▄░█" -f Blue
    Write-Host "█ █░▀█ ▀▄▀ █▄█ █░█ ██▄ ░░" -NoNewline
    Write-Host " █▄▄ █▄█ █░▀░█ █░▀░█ █▀█ █░▀█ █▄▀ " -NoNewline -f Blue
    Write-Host "█▄▄ █ █░▀█ ██▄ " -f DarkGray -NoNewline
    Write-Host "█▄█ █▄█ █▀░ █▄█ ▄█ █▄▄ █▀█ ░█░ █ █▄█ █░▀█ " -f blue
    Write-Host "By " -NoNewline
    Write-Host "@Wietze" -f Blue -NoNewline
    Write-Host ", (c) 2024`n"

    $InputFile = Read-Host "Path to configuration file"
    if (!($n = Read-Host "Number of commands to generate [default=$n_default]")) { $n = $n_default }
} else {
    $InputFile = $Args[0]
    $n = $Args[1]

    if($args.Length -gt 2){
        throw "Unexpected argument count"
    }
}

Invoke-CommandLineObfuscation -InputFile $InputFile -n $n
