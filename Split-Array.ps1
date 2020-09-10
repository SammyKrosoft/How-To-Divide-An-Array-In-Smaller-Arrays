<#

#>
[CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)][array]$MainArray,
        [Parameter(Mandatory=$true)][int]$Chunksize
        )
       
       
# Storing the size of the list (number of items) in a variable for better readability
$ArraySize = $MAinArray.count
# Counted 3985 users

# Calculating the number of smaller lists we need 
$Parts = [math]::Ceiling($ArraySize/$ChunkSize)

Write-host "Total number of items in the table to split: $ArraySize"
Write-Host "Number of items per sub-table: $ChunkSize"
Write-Host "Parts needed : $Parts"
Write-Host "The first $($Parts-1) parts will have $ChunkSize items, and the last one will have $($ArraySize-($Parts-1)*$ChunkSize) items" -BackgroundColor blue -ForegroundColor Yellow

# Iterating the total number of sub-lists (calculated with the math Ceiling() function) to populate each sublist with the max number of items
For ($i=0; $i -le $Parts;$i++){
    #Starting index of the main table for the sub-table $i
    $Start = $i*$Chunksize
    #Ending index of tha main table for the sub-table $i
    $End = (($i+1) * $Chunksize)-1
    #Appending each smaller list in another array typed variable - notice the ',@(<Array>)' notation to force the $SubArray variable to be typed as an array variable
    $SubArray += ,@($MainArray[$Start..$End])
}

#Subarray is an array of sub-arrays, and each sub-array have a number of items defined by $ChunkSize.
Return $SubArray

