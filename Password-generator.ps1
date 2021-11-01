# Random password generator
#
write-host "Create N number of passwords,
each will have a user-specified number of lowercase characters, 
plus 1 Uppercase letter, 
1 number and 1 special character."


function Get-RandomCharacters($length, $characters) {
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs=""
    return [String]$characters[$random]
}

<#
function Scramble-String([string]$inputString){     
    $characterArray = $inputString.ToCharArray()   
    $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
    $outputString = -join $scrambledStringArray
    return $outputString 
}
#>

# Prompt user for amount of passwords to generate and length:
$num = read-host "How many Passwords to generate?"
$len = read-host "How many characters should the passwords be?"


do {
#change the "length" to get longer passwords
$password = Get-RandomCharacters -length ($len - 3) -characters 'abcdefghiklmnoprstuvwxyz'
$password += Get-RandomCharacters -length 1 -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
$password += Get-RandomCharacters -length 1 -characters '1234567890'
$password += Get-RandomCharacters -length 1 -characters '!"$%&/()=?}][{@#*+'
#$password = scramble-string
$num -= 1
Write-Host $password
} while ($num -gt 0)
