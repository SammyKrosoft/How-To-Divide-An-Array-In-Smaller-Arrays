# How-To-Divide-An-Array-In-Smaller-Arrays

## Principle

. You have an array of 30 items (can be strings, numbers, anything), and you want to divide it on smaller arrays of 7 items
. Use the math's "CEILING" function, ```[math]::ceiling()``` which will give the result of the 30 items array divided by the 7 items which is what we want the smaller array size to be
In our case, 30/7 equals 4.28 approx => we can divide our 30 items array into 4 tables, and we will have a leftover (.28) => we will then need **5 tables** to store all our **30 items**. **4 tables will have exactly 7 items** (that covers 28 items from our original table), and **the last one will have 2 items** (to get our total of 30 items of the original table). That Math::CEILING function is the key of our number of sub-arrays calculation here.
. Then with a FOR (){} loop that covers our 5 smaller tables (running from $i=0 to $i=5, translated in PowerShell condition to ```$i -le 5 ```), we set the starting index of the original table ```$i*$Chunksize``` and then the end of the original table ```($i+1)*$ChunkSize```

We'll note that **($i) x Chunksize** and **[($i+1) x ChunkSize] - 1** correspond to parts of the initial Array that are exactly the size of the ChunkSize we define (7 items in our example):
- First smaller array, when $i equals 0 in the FOR loop, the first part of the initial array will stretch from $i x 7 = 0 to ($i+1 x 7) = 1 x 30 = 7, minus 1 for the end bound that is 6 (remember, arrays in Powershell starts in index 0, that's why we remove 1 for the end bound here)
- Second smaller array, when $i = 1 in the FOR loop, the second part of the initial array will stretch from $i x 30 = 1 x 7 = 7 to ($i+1 x 7) = 2 x 7 = 14 minus 1 for the end bound that is 13
- Third smaller array, when $i = 2 in the FOR loop, that third part of the initial array will stretch from $i x 30 = 2 x 7 = 14 to ($i+1 x 7) = 3 x 7 = 21 minus 1 for the end bound that is 20
- Fourth and last array, when $i = 3 in the FOR loop, that fourth part of the initial array will stretch from $i x 30 = 3 x 7 = 21 to ($i+1 x 7) = 4 x 7 = 28 minus 1 for the end bound that is 27

. Then inside the FOR loop, we append each sub-array in a global array (using ```$SubArrays += ,@($BigArray[$i*$ChunkSize..$($i+1)*$ChunkSize]``` - but we preferred to pre-store ```$i*$Chunksize``` in a variable we call ```$Start``` and ```(($i+1)*$ChunkSize)-1``` in a variable we call ```$End``` for the start and the end of the array
