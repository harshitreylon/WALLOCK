# WALLOCK
<br/>

## PowerShell script for changing wallpaper and lock screen with image fetched from remote URL (generally for organization using AD and wants to manage corporate lock screen/wallpaper using script). This will also prevent any modification or changing of image by the user through any settings in Windows for both the wallpaper and lock screen, until the registry key itself is deleted. [^1][^2]
<br/>

> Inspired by [Geir Dybbugt's script](https://github.com/geirdybbugt/Archive-Dybbugt.no/blob/master/Win10/Win10-SetWallpaperAndLockscreenFromUri.ps1)
<br/>
<br/>

***Note:*** 
[^1]: This script uses the Personalization configuration service provider (CSP), so it will only be supported in Windows 10 (version 1703 or later), Windows 10 Enterprise and Education SKUs, Windows 10 Pro and Windows 10 Pro in S mode if SetEduPolicies in SharedPC CSP is set.

[^2]: This script requires elevated privileges (PowerShell as administrator) , so deal with it accordingly.
