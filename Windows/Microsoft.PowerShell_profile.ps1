# oh-my-posh init pwsh --config $env:LocalAppData\Programs\oh-my-posh\themes\ys.omp.json | Invoke-Expression

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-Alias -Name which -Value Get-Command

function cnpm {
  npm --registry https://registry.npmmirror.com/ @args
}
function cyarn {
  yarn --registry https://registry.npmmirror.com/ @args
}
function cpnpm {
  pnpm --registry https://registry.npmmirror.com/ @args
}

function proxy {
  $env:HTTP_PROXY = 'http://localhost:7890'
  $env:HTTPS_PROXY = 'http://localhost:7890'
  $env:ALL_PROXY = 'http://localhost:7890'
}
