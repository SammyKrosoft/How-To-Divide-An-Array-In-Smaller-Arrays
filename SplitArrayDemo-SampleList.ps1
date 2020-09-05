# Here is a sample list with 30 names
$USersList = "Dolores","Jessie","Robert","Viola","Rosa","Rose","Carroll","Jessie","Lloyd","Cora","Barry","Theodore","Morris","Joseph","Beverly","Connie","Charlotte","Rosie","Jerome","Nicholas","Everett","Homer","Carl","Harriet","Lewis","Warren","Clifford","Duane","Jon","Katherine"

$ArraySize = $UsersList.count
# Counted 3985 users

#$ChunkSize = 3000
$ChunkSize = 7
$Parts = [math]::Ceiling($ArraySize/$ChunkSize)

Write-host "Total number of items in the table to split: $ArraySize"
Write-Host "Number of items per sub-table: $ChunkSize"
Write-Host "Parts needed : $Parts"
Write-Host "The first $($Parts-1) parts will have $ChunkSize items, and the last one will have $($ArraySize-($Parts-1)*$ChunkSize) items" -BackgroundColor blue -ForegroundColor Yellow

$Counter = 0
$UserList1 = @()
For ($i=0; $i -le $Parts;$i++){
    $Start = $i*$Chunksize
    $End = (($i+1) * $Chunksize)-1
    $SubArray += ,@($UsersList[$Start..$End])
}

Write-Host "Finished ! To refer to each of the $Part chunks, we use `$SubArray[n] where n is between 0 and $($Parts-1)" -ForegroundColor Yellow
