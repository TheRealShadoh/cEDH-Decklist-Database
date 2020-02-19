Import-module $PSScriptRoot/functions.psm1


#$testurl = 'https://tappedout.net/mtg-decks/grenzo-ft-dj-doomsday-competitive-primer/'

$dbPrimary = 'https://sheets.googleapis.com/v4/spreadsheets/1NYZ2g0ETfGulhPKYAKrKTPjviaLERKuvyKyk9oizV8Q/values/!A2:J?key=AIzaSyCy2pE5znDZ9uDdpSgYb2Q992r0YOIPuIw'
$dbFringe = "https://sheets.googleapis.com/v4/spreadsheets/1NYZ2g0ETfGulhPKYAKrKTPjviaLERKuvyKyk9oizV8Q/values/fringe!A2:J?key=AIzaSyCy2pE5znDZ9uDdpSgYb2Q992r0YOIPuIw"

$primaryData = dbGet -url $dbPrimary
$fringeData = dbGet -url $dbFringe

$primaryLists = dbParse -DataInput $primaryData
$fringeLists = dbParse -DataInput $fringeData

$combinedLists = @()
$combinedLists += $primaryLists
$combinedLists += $fringeLists


$array = @()
Foreach ($list in $combinedLists.list)
{
        $deckList = decklistGet -url $list
        $deckList.defaultValue | out-file .\tmpOut.txt
        $cleanedData = Get-Content .\tmpOut.txt
        Remove-item .\tmpOut.txt
        $array += $cleanedData
}