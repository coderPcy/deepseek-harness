' DeepSeek Harness 桌面快捷方式创建脚本
' 使用方法: 双击此脚本或在命令行运行 cscript create-shortcut.vbs

Set oShell = CreateObject("WScript.Shell")
Set oFSO = CreateObject("Scripting.FileSystemObject")

' 获取脚本所在目录的父目录（项目根目录）
strScriptPath = oFSO.GetParentFolderName(WScript.ScriptFullName)
strProjectRoot = oFSO.GetParentFolderName(strScriptPath)

' 创建快捷方式
Set oLink = oShell.CreateShortcut(oShell.SpecialFolders("Desktop") & "\DeepSeek Harness.lnk")
oLink.TargetPath = strProjectRoot & "\custom-setup\start-deepseek.bat"
oLink.WorkingDirectory = strProjectRoot
oLink.Description = "Start DeepSeek Harness Web UI"

' 设置图标（如果存在）
strIconPath = strProjectRoot & "\custom-setup\deepseek-icon.ico"
If oFSO.FileExists(strIconPath) Then
    oLink.IconLocation = strIconPath
Else
    ' 使用默认系统图标
    oLink.IconLocation = "C:\Windows\System32\shell32.dll,13"
End If

oLink.Save

WScript.Echo "Desktop shortcut created successfully!"
WScript.Echo "Location: " & oShell.SpecialFolders("Desktop") & "\DeepSeek Harness.lnk"
