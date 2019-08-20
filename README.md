# ps-petname

## Name

**ps-petname** is a PowerShell implimentation of the PetName name generator from Dustin Kirkland (https://github.com/dustinkirkland/petname).

## Description

This script will generate "pet names", consisting of a random combination of an adverb, adjective, and an animal name. These are useful for unique hostnames or container names, for instance.

As such, PetName tries to follow the tenets of Zooko’s triangle. Names are:

- human meaningful
- decentralized
- secure

## Usage

ps-petname takes three parameters:
- Number of words to use in the name (default is 3)
- Separator to use (default is "-")

![Screenshot of PowerShell Window](https://github.com/BenjaminArmstrong/ps-petname/raw/master/Media/petname.png "Examples in use")

## petname builders

There are two "builder" scripts.

petname-variable-builder.ps1 is a script that pulls the source data from Dustin's repo and then creates the "small", "medium" and "large" variable files that can be dotsourced in.

ps-petname-builder.ps1 creates the monolithic "ps-petname" that includes the database information in it as variables.  The posted version of ps-petname.ps1 uses the medium database.

## Author

This utility was created by Benjamin Armstrong, based on the original project by Dustin Kirkland