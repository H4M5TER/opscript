# fetch and iterate 3rd party app, grep pkgname
foreach ($pkgname in adb shell pm list packages -3 | ForEach-Object {$_ -replace 'package:',''}) {
  mkdir $pkgname
  # fetch and iterate files, storage separate apks in apk bundle together
  foreach ($path in adb shell pm path $pkgname | ForEach-Object {$_ -replace 'package:',''}) {
    $filename = $path -replace '.*\/',''
    adb pull $path ./$pkgname/$filename
  }
}
