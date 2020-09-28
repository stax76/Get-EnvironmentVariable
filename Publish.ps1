
$key = Read-Host 'Enter API key'
Publish-Script -Path .\Get-EnvironmentVariable.ps1 -NuGetApiKey $key
