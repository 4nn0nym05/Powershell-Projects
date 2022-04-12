if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

$scriptpath = (Get-ChildItem .\Get-Hash.ps1 ).FullName
$command = "powershell.exe -WindowStyle Hidden -command &`"$scriptpath`""

Set-Location -LiteralPath Registry::HKEY_CLASSES_ROOT\*\shell
New-Item .\GetFileHash -Force
Set-Item .\GetFileHash "Get File Hash"
New-ItemProperty .\GetFileHash -Name 'Icon' -Value "powershell.exe" -PropertyType String
New-ItemProperty .\GetFileHash -Name 'Position' -Value "top" -PropertyType String
New-Item .\GetFileHash\command -Force
Set-Item .\GetFileHash\command "$command '%V'"

