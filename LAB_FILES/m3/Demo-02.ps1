# Show the help for Out-String
Help out-string

# Show outputting a cmdlet to a string, and explore the property type when Out-String has finished processing it
Get-Process | Out-String
Get-Process | Out-String | Get-Member | more

# Explore some of the operations you can do when working with the original object type in PowerShell
$process = Get-Process
$process.count
$process[0]
$process[1]
$process | select-object -First 1
$process | select-object -First 5
$process | select-object -First 1 | get-member | more

# Explore some similar operations after having converted it to a string, and see some of the limitations
$process = Get-Process | Out-String
$process.count
$process
$process[0]
$process[1]
$process[2]
$process | select-object -First 1
Cls


# Use the stream parameter to store each object coming down the pipeline as its own string in an array
$process = Get-Process | Out-String -Stream
$process.count
$process[0]
$process[1]
$process[2]
$process[3]
$process[3] | Get-Member | more