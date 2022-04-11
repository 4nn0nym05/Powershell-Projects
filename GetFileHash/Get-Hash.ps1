$path = $args[0]

$sha1 = (Get-FileHash -Algorithm SHA1 -Path $path).Hash
$sha256 = (Get-FileHash -Algorithm SHA256 -Path $path).Hash
$sha512 = (Get-FileHash -Algorithm SHA512 -Path $path).Hash
$md5 = (Get-FileHash -Algorithm MD5 -Path $path).Hash
Add-Type -AssemblyName PresentationFramework


[System.Windows.MessageBox]::Show("$path`n `n  SHA1 `n`n$sha1`n`n `n SHA256 `n`n$sha256`n`n `n SHA512 `n`n$sha512`n`n `n MD5 `n`n$md5`n`n")


