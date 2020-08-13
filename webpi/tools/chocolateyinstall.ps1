$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://go.microsoft.com/fwlink/?LinkId=287165' 
$url64      = 'https://go.microsoft.com/fwlink/?LinkId=287166' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI' 
  url           = $url
  url64bit      = $url64

  softwareName  = 'webpi*' 
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 
