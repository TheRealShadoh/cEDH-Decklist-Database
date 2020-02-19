Function dbGet
{
    [CmdletBinding()]
    param(
        [Parameter(mandatory=$true)]
        [string] $url
    )
    $RawContent = Invoke-WebRequest -Uri $url -UseBasicParsing
    $JSONContent = $RawContent.content | Convertfrom-Json
    Return $JSONContent
}
Function dbParse
{
    [CmdletBinding()]
    param(
        [Parameter(mandatory=$true)]
        $DataInput
    )
    $array = @()
    ForEach ($obj in $DataInput."values")
    {
        $data = [PSCustomObject]@{
            Commander = $obj[4]
            DeckName = $obj[2]
            Strategy = $obj[1]
            Colors = $obj[6]
            Description = $obj[5]
            List = $obj[3].split(",")
            Date = [datetime]$obj[9]
        }
        $array += $data
    }
    return $array
}
Function decklistGet
{
    [CmdletBinding()]
    param(
        [Parameter(mandatory=$true)]
        [string] $url
    )
    $RawContent = Invoke-WebRequest -Uri $url
    $RawContent = $RawContent.ParsedHtml.getElementsByName('mtga-textarea')
    #$RawContent = $RawContent | Convertfrom-html
    Return $RawContent
}