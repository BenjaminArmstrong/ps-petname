#   Creates a single .ps1 file for the pet-name generator, including massive variable lines
#
#   Written by Benjamin Armstrong

Param (
# default to using the medium database
[string]$dbSize="medium"
)

. .\ps-petname-builder.ps1

$ScriptBlock1 = {#   ps-petname: library for generating human-readable, random names
#               for objects (e.g. hostnames, containers, blobs)
#
#   Written by Benjamin Armstrong, based on work by Dustin Kirkland

Param (
# Default to three words, separated by a hyphen
[int]$words = 3,
[string]$separator = "-"
)
}

$variableBlock = Get-Content ".\$($dbSize)PetNameVariables.ps1"

$ScriptBlock2 = {
# Every name starts with a name.  This is all that will get returned if the
# User asks for 1 word (or 0 words, or -100)
$output = $petNames[(get-random -Minimum 0 -Maximum $petNames.Count)]

# The second word is always an adjective
if ($words -ge 2)
{
    $output = $petAdjectives[(get-random -Minimum 0 -Maximum $petAdjectives.Count)] + $separator + $output 
}

# Anything greater than 2 will be an Adverb
if ($words -gt 2)
{
    for ($counter = 2; $counter -lt $words; $counter++)
    {
        $output = $petAdverbs[(get-random -Minimum 0 -Maximum $petAdverbs.Count)] + $separator + $output
    }
}

return $output}

$ScriptBlock1 | out-file -FilePath .\..\ps-petname.ps1
$variableBlock | out-file -FilePath .\..\ps-petname.ps1 -Append
$ScriptBlock2 | out-file -FilePath .\..\ps-petname.ps1 -Append