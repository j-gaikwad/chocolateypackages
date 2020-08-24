$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://go.microsoft.com/fwlink/?LinkId=287165' 
$url64      = 'https://go.microsoft.com/fwlink/?LinkId=287166' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI' 
  url           = $url
  url64bit      = $url64
  softwareName  = 'webpi*' 
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes= @(0, 3010, 1641)
  checksum      = "62E871352B413BC976D8E9402697C684B26807EB863B14D2F54677BDB969DD14"
  checksumType  = "sha256"
  checksum64    = "13F4CBB9FA554F77F2AB407BAA40501FC6C131F3077D48AAB839CE63ED8A90E2"
  checksumType64= "sha256"
}

Install-ChocolateyPackage @packageArgs 
