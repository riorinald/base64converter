# Function to encode string to Base64
function Encode-Base64 {
    param (
        [string]$inputString
    )
    $byteArray = [System.Text.Encoding]::UTF8.GetBytes($inputString)
    return [Convert]::ToBase64String($byteArray)
}

# Function to decode Base64 string back to original string
function Decode-Base64 {
    param (
        [string]$base64String
    )
    $byteArray = [Convert]::FromBase64String($base64String)
    return [System.Text.Encoding]::UTF8.GetString($byteArray)
}

# Clear the console screen initially
Clear-Host

# Display the initial welcome message and the first prompt
Write-Host "Select an option:"
Write-Host "1. Encode string to Base64"
Write-Host "2. Decode Base64 to string"

# Main loop for the initial choice (encode or decode)
$action = Read-Host "Enter your option (1 or 2)"
Write-Host "`nStarting..."
if ($action -eq '1') {
    # Encoding mode
    Write-Host "Please paste a string to convert to Base64."
    # Start encoding loop
    while ($true) {
        $stringToEncode = Read-Host "Enter string to encode"
        $base64Encoded = Encode-Base64 -inputString $stringToEncode
        Write-Host "Base64 Encoded String:" 
	Write-Host "$base64Encoded"
        Write-Host "`nPlease paste another string or close the window to exit."
    }
}
elseif ($action -eq '2') {
    # Decoding mode
    Write-Host "Please paste a Base64 string to decode."
    # Start decoding loop
    while ($true) {
        $base64ToDecode = Read-Host "Enter Base64 string to decode"
        try {
            $decodedString = Decode-Base64 -base64String $base64ToDecode
            Write-Host "Decoded String:"
	    Write-Host "$decodedString"
        } catch {
            Write-Host "Invalid Base64 string, unable to decode."
        }
        Write-Host "`nPlease paste another Base64, or close the window to exit."
    }
}
else {
    Write-Host "Invalid option selected. Please restart the script and choose '1' for encoding or '2' for decoding."
}
