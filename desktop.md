``` powershell
# uninstall win10 app
Get-AppxPackage *zunemusic* | Remove-AppxPackage 
Get-AppxPackage *windowsmaps* | Remove-AppxPackage

#uninstlal software
(Get-WmiObject -class win32_product  | ?{$_.Name -like '*skype*'} ).uninstall()
```