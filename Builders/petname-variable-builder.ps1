# Pulls the petname data compiled by Dustin Kirkland from Github
# Then parses it into three different PowerShell scripts (small, medium and large)
# These scripts can then be dot-sourced into a pet name generator
#
#   Written by Benjamin Armstrong

$sizes = @("small", "medium", "large")
$topics = @("adverbs", "adjectives", "names")

foreach ($size in $sizes)
{

    # Create a clean file to put the output in
    New-item "./$($size)PetNameVariables.ps1" -ItemType file -Force

    foreach ($topic in $topics)
    {
    
        # Where Dustin stores his data
        $url = "https://raw.githubusercontent.com/dustinkirkland/petname/master/usr/share/petname/$($size)/$($topic).txt"
        $sourceString = (New-Object System.Net.WebClient).DownloadString($url)
        $arrayName = "pet" + (Get-Culture).TextInfo.ToTitleCase($topic)

        [string]$output = "`$$($arrayName) = @("

        foreach ($word in $sourceString.split())
            {
                # Source files have a trailing blank line that needs to be filtered out
                if ("" -ne $word)
                    {
                        [string]$output = $output + "`"$($word)`", "
                    }
            }

        [string]$output = $output.trimend(", ")
        [string]$output = $output + ")"

        $output | out-file -FilePath "./$($size)PetNameVariables.ps1" -Append
    }
}