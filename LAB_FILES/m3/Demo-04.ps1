# Show the help for Out-Null
Help out-null
cls

# Show an example of where Out-Null will supress the output
New-Item -Name test -ItemType Directory
Remove-Item .\test
New-Item -Name test -ItemType Directory | Out-Null
Get-ChildItem
New-Item -Name test2 -ItemType Directory | Out-Null | Get-Member
Cls

# Piping to Out-Null will, by default, only null the success stream. An error will still be output to the console
Get-ChildItem Potato | Out-Null

# Show an example of nuances with out-null and variables
$dir = Get-ChildItem | Out-Null
$dir
($dir = Get-ChildItem) | Out-Null
$dir

# Show an example of adding objects to an Array List outputting data, and then suppressing it with Out-Null
$MyArray = New-Object System.Collections.ArrayList
$MyArray.Add('Thing1')
$MyArray.Add('Thing2')
$MyArray.Add('Thing3')
$MyArray
$MyArray.Add('Thing4') | Out-Null
$MyArray
Cls

# You can also suppress with using the redirection operator to redirect it to $null
$MyArray.Add('Thing5') > $null
$MyArray

# Or by adding the command to the variable $null
$null = $MyArray.Add('Thing6')
$MyArray

# Or finally, by casing it to [void]
[void]$MyArray.Add('Thing7')
$MyArray