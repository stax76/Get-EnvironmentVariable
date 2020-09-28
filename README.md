# Get-EnvironmentVariable

PowerShell script to manage environment variables.

## Download and Installation

https://www.powershellgallery.com/packages/Get-EnvironmentVariable

## Get-EnvironmentVariable

Returns the value of a environment variable. If it's a semicolon separated list then the list items are returned line by line.

```
NAME
    Get-EnvironmentVariable

SYNTAX
    Get-EnvironmentVariable [-Name] <string> [-Machine] [-User]  [<CommonParameters>]

ALIASES
    gev
```

## Set-EnvironmentVariable

Sets the value of a environment variable.

```
NAME
    Set-EnvironmentVariable

SYNTAX
    Set-EnvironmentVariable [-Name] <string> [[-Value] <string>] [-Machine] [-User]  [<CommonParameters>]

ALIASES
    sev
```

## Add-EnvironmentVariableItem

Adds a item to the top of a semicolon separated list such as PATH. If the item already exists then it's pushed to the top (or end using -End).

```
NAME
    Add-EnvironmentVariableItem

SYNTAX
    Add-EnvironmentVariableItem [-Name] <string> [-Value] <string> [-Machine] [-User] [-End]  [<CommonParameters>]

ALIASES
    aevi
```

## Remove-EnvironmentVariableItem

Removes a item from a semicolon separated list such as PATH.

```
NAME
    Remove-EnvironmentVariableItem

SYNTAX
    Remove-EnvironmentVariableItem [-Name] <string> [-Value] <string> [-Machine] [-User]  [<CommonParameters>]

ALIASES
    revi
```
