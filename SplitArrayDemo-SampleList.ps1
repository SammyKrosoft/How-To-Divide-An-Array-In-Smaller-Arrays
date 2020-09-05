# Here is a sample array with 30 names
$USersList = "Dolores","Jessie","Robert","Viola","Rosa","Rose","Carroll","Jessie","Lloyd","Cora","Barry","Theodore","Morris","Joseph","Beverly","Connie","Charlotte","Rosie","Jerome","Nicholas","Everett","Homer","Carl","Harriet","Lewis","Warren","Clifford","Duane","Jon","Katherine"

# Counting number of names in the array
$ArraySize = $UsersList.count

# Determining max number of items per array
$ChunkSize = 7

# Determinig how many sub-lists of max $ChunkSize items we need to store all names in the list
$Parts = [math]::Ceiling($ArraySize/$ChunkSize)

# Displaying the resulting numbers...
Write-host "Total number of items in the table to split: $ArraySize"
Write-Host "Number of items per sub-table: $ChunkSize"
Write-Host "Parts needed : $Parts"
Write-Host "The first $($Parts-1) parts will have $ChunkSize items, and the last one will have $($ArraySize-($Parts-1)*$ChunkSize) items" -BackgroundColor blue -ForegroundColor Yellow

# Processing the split of the whole list according to the number of items we want in each smaller list

For ($i=0; $i -le $Parts;$i++){
    $Start = $i*$Chunksize
    $End = (($i+1) * $Chunksize)-1
    $SubArray += ,@($UsersList[$Start..$End])
}

Write-Host "Finished ! To refer to each of the $Part chunks, we use `$SubArray[n] where n is between 0 and $($Parts-1)" -ForegroundColor Yellow
