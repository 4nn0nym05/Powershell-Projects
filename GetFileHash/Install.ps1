
$pa = (Get-ChildItem "$(cd)" -Filter install.reg -Recurse | % {$_.FullName})
regedit /s "$pa"


