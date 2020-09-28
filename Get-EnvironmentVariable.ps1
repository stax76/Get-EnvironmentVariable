
<#PSScriptInfo

.DESCRIPTION PowerShell script that manages environment variables.

.VERSION 1.1

.GUID 7f47c6da-f7af-45c4-a997-18ca3192de21

.AUTHOR Frank Skare (stax76)

.COPYRIGHT (C) Frank Skare (stax76)

.TAGS environment env envvar

.PROJECTURI https://github.com/stax76/Get-EnvironmentVariable

#>

function Get-EnvironmentVariable
{
    [CmdletBinding()]
    [Alias('gev')]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $Name,
        [Switch] $Machine,
        [Switch] $User
    )

    process
    {
        $scope = 'Process'

        if ($Machine) { $scope = 'Machine' }
        if ($User)    { $scope = 'User' }

        $value = [Environment]::GetEnvironmentVariable($Name, $scope)
        $value -split ';'
    }
}


function Set-EnvironmentVariable
{
    [CmdletBinding()]
    [Alias('sev')]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $Name,
        [string] $Value,
        [Switch] $Machine,
        [Switch] $User
    )

    process
    {
        $scope = 'Process'

        if ($Machine) { $scope = 'Machine' }
        if ($User)    { $scope = 'User' }

        [Environment]::SetEnvironmentVariable($Name, $Value, $scope)
    }
}


function Add-EnvironmentVariableItem
{
    [CmdletBinding()]
    [Alias('aevi')]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $Name,
        [Parameter(Mandatory=$true)]
        [string] $Value,
        [Switch] $Machine,
        [Switch] $User,
        [Switch] $End
    )

    process
    {
        $scope = 'Process'

        if ($Machine) { $scope = 'Machine' }
        if ($User)    { $scope = 'User' }

        $var = [Environment]::GetEnvironmentVariable($Name, $scope)
        $tempItems = New-Object Collections.Generic.List[String]

        foreach ($i in ($var -split ';'))
        {
            $i = $i.Trim()

            if ($i -eq '' -or $i -eq $Value)
            {
                continue
            }

            $tempItems.Add($i)
        }

        $var = $tempItems -join ';'

        if ($End)
        {
            $var = $var + ';' + $Value
        }
        else
        {
            $var = $Value + ';' + $var
        }

        [Environment]::SetEnvironmentVariable($Name, $var, $scope)
    }
}


function Remove-EnvironmentVariableItem
{
    [CmdletBinding()]
    [Alias('revi')]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $Name,
        [Parameter(Mandatory=$true)]
        [string] $Value,
        [Switch] $Machine,
        [Switch] $User
    )

    process
    {
        $scope = 'Process'

        if ($Machine) { $scope = 'Machine' }
        if ($User)    { $scope = 'User' }

        $var = [Environment]::GetEnvironmentVariable($Name, $scope)
        $tempItems = New-Object Collections.Generic.List[String]

        foreach ($i in ($var -split ';'))
        {
            $i = $i.Trim()

            if ($i -eq '' -or $i -eq $Value)
            {
                continue
            }

            $tempItems.Add($i)
        }

        $var = $tempItems -join ';'
        [Environment]::SetEnvironmentVariable($Name, $var, $scope)
    }
}
