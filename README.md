# ps-petname

## Name

**ps-petname** is a PowerShell implimentation of the PetName name generator from Dustin Kirkland (https://github.com/dustinkirkland/petname).

## Description

This module (PSPetName) will generate "pet names", consisting of a random combination of an adverb, adjective, and an animal name. These are useful for unique hostnames or container names, for instance.

As such, PetName tries to follow the tenets of Zooko’s triangle. Names are:

- human meaningful
- decentralized
- secure

## Usage

PSPetName contains only one Cmdlet-style funtion: New-PSPetName
New-PSPetName takes the following parameters:
- -WordsPerName :: Number of words to use in the name (default is 3)
- -Separator :: Word spacer to use (default is "-")
- -PascalCase :: [switch] parameter that flags to capitalize the first letter of each word
- -NumberOfNames :: Number of total names to generate at once. Much quicker to run 'New-PSPetName -NumberOfNames 1000' vs. '$i=0; Do { New-PSPetName; $i++ } while ($i -lt 1000)'
- -FolderPath :: Non-default path to folder containing a name.csv, adj.csv, and adv.csv to use in this runs name generation

![Screenshot of PowerShell Window](https://github.com/BenjaminArmstrong/ps-petname/raw/master/Media/petname.png "Examples in use")

*Footnote:<br>Running the 'Do-while' loop above 100 times took 3+ times longer than generating 1,000 names using the parameter '-NumberOfNames' on my machine.*<br>1.104 *seconds vs* 0.314 *seconds*

## petname builders

***Likely Currently Broken***

There are two "builder" scripts.

petname-variable-builder.ps1 is a script that pulls the source data from Dustin's repo and then creates the "small", "medium" and "large" variable files that can be dotsourced in.

ps-petname-builder.ps1 creates the monolithic "ps-petname" that includes the database information in it as variables.  The posted version of ps-petname.ps1 uses the medium database.

## To-do

[x] I really should turn this into a module - so that is on the backlog.  But if anyone wants to take a crack at it, contributions are welcome :-)

## Author

This utility was created by Benjamin Armstrong, based on the original project by Dustin Kirkland. Modulized by Mitchell Tombs, a gentleman with too much free time.