Import-module $PSScriptRoot/functions.psm1


$testurl = 'https://tappedout.net/mtg-decks/grenzo-ft-dj-doomsday-competitive-primer/'

$test = decklistGet -url $testurl
$test.defaultValue | out-file .\tmpOut.txt
$cleanedData = Get-Content .\tmpOut.txt
Remove-item .\tmpOut.txt
