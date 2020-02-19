Import-module $PSScriptRoot/functions.psm1

$dbPrimary = 'https://sheets.googleapis.com/v4/spreadsheets/1NYZ2g0ETfGulhPKYAKrKTPjviaLERKuvyKyk9oizV8Q/values/!A2:J?key=AIzaSyCy2pE5znDZ9uDdpSgYb2Q992r0YOIPuIw'
$dbFringe = "https://sheets.googleapis.com/v4/spreadsheets/1NYZ2g0ETfGulhPKYAKrKTPjviaLERKuvyKyk9oizV8Q/values/fringe!A2:J?key=AIzaSyCy2pE5znDZ9uDdpSgYb2Q992r0YOIPuIw"

$primaryData = dbGet -url $dbPrimary
$fringeData = dbGet -url $dbFringe

$primaryLists = dbParse -DataInput $primaryData
$fringeLists = dbParse -DataInput $fringeData

$combinedLists = @()
$combinedLists += $primaryLists
$combinedLists += $fringeLists

$combinedLists |  Sort-Object -Property Date -Descending #Show most recently updated decks first
