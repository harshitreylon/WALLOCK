<#*** Just set both the URL and you are good to go. ***#>

#assigning wallpaper url

#$WallpaperURL = Read-Host -Prompt "Enter Wallpaper URL" #if user input is required
$WallpaperURL = "Enter_URL_here" #for hardcoding URL



#assigning lockscreen url

#$LockscreenURL = Read-Host -Prompt "Enter Lockscreen URL" #if user input is required
$LockscreenURL = "Enter_URL_here" #for hardcoding URL



#assigning destination folder and image for both wallpaper and lock screen

$ImgDestFld = "C:\temp" #assigning destination folder
$WallpDestFl = "$ImgDestFld\wallp.png" #assigning wallpaper image
$LockScrFl = "$ImgDestFld\lckscr.png" #assigning lock screen image



#creating destination folder

md $ImgDestFld -ErrorAction SilentlyContinue



#downloading remote image

Invoke-WebRequest $WallpaperURL -OutFile "$WallpDestFl"
Invoke-WebRequest $LockscreenURL -OutFile "$LockScrFl"



#assigning the wallpaper and lockscreen

$regKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP'
$DesktopPath = "DesktopImagePath" 
$DesktopStatus = "DesktopImageStatus"
$DesktopUrl = "DesktopImageUrl"
$LockScreenPath = "LockScreenImagePath"
$LockScreenStatus = "LockScreenImageStatus"
$LockScreenUrl = "LockScreenImageUrl"
$StatusValue = "1"
$DesktopImageValue = "$WallpDestFl"
$LockScreenImageValue = "$LockScrFl"



#checking if registry key is already present

#creates new registry key and values if not found
if(!(Test-Path $regKey)) {
    New-Item -Path $regKey -Force | Out-Null
    New-ItemProperty -Path $regKey -Name $DesktopStatus -Value $Statusvalue -PropertyType DWORD -Force | Out-Null
    New-ItemProperty -Path $regKey -Name $LockScreenStatus -Value $StatusValue -PropertyType DWORD -Force | Out-Null
    New-ItemProperty -Path $regKey -Name $DesktopPath -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
    New-ItemProperty -Path $regKey -Name $DesktopUrl -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
    New-ItemProperty -Path $regKey -Name $LockScreenPath -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
    New-ItemProperty -Path $regKey -Name $LockScreenUrl -Value $LockScreenImageValue -PropertyType STRING -Force | Out-Null
}

#sets the already present registry key with values
else {
    Set-ItemProperty -Path $regKey -Name $DesktopStatus -Value $Statusvalue -Type DWORD -Force
    Set-ItemProperty -Path $regKey -Name $LockScreenStatus -Value $StatusValue -Type DWORD -Force
    Set-ItemProperty -Path $regKey -Name $DesktopPath -Value $DesktopImageValue -Type STRING -Force
    Set-ItemProperty -Path $regKey -Name $DesktopUrl -Value $DesktopImageValue -Type STRING -Force
    Set-ItemProperty -Path $regKey -Name $LockScreenPath -Value $LockScreenImageValue -Type STRING -Force
    Set-ItemProperty -Path $regKey -Name $LockScreenUrl -Value $LockScreenImageValue -Type STRING -Force
}



#restarting explorer.exe

stop-process -name explorer -Force



#clears the error log

$error.clear()