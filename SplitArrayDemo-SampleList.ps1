# Here is a sample array with 30 names
$USersList = "Dolores","Jessie","Robert","Viola","Rosa","Rose","Carroll","Jessie","Lloyd","Cora","Barry","Theodore","Morris","Joseph","Beverly","Connie","Charlotte","Rosie","Jerome","Nicholas","Everett","Homer","Carl","Harriet","Lewis","Warren","Clifford","Duane","Jon","Katherine"

# Counting number of names in the array
$ArraySize = $UsersList.count

# Determining max number of items per array
$ChunkSize = 7

# Using the math::Ceiling() funciton, we determe how many sub-lists of $ChunkSize items max we need to store all names in the main list
$Parts = [math]::Ceiling($ArraySize/$ChunkSize)

# Summarizing all the numbers (number of items in the array, how many items we want to separate this list, how many parts we need...)
Write-host "Total number of items in the table to split: $ArraySize"
Write-Host "Number of items per sub-table: $ChunkSize"
Write-Host "Parts needed : $Parts"
Write-Host "The first $($Parts-1) parts will have $ChunkSize items, and the last one will have $($ArraySize-($Parts-1)*$ChunkSize) items" -BackgroundColor blue -ForegroundColor Yellow

# Processing the split of the whole list according to the number of items we want in each smaller list

For ($i=0; $i -le $Parts;$i++){
    #Starting index of the main table for the sub-table $i
    $Start = $i*$Chunksize
    #Ending index of tha main table for the sub-table $i
    $End = (($i+1) * $Chunksize)-1
    $SubArray += ,@($UsersList[$Start..$End])
}

# We end up having a $SubArray that contain the smaller arrays that the main list $UsersList has been split into
# We can use a specific Sub-array to a function by calling $SubArray[N] where N is the specific sub-array we need.
Write-Host "Finished ! To refer to each of the $Part chunks, we use `$SubArray[n] where n is between 0 and $($Parts-1)" -ForegroundColor Yellow
