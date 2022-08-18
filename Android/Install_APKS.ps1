foreach ($folder in (Get-ChildItem))
{
Set-Location $folder
$apks = Get-ChildItem -Name
adb install-multiple $apks
}