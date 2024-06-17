@echo off
setlocal enabledelayedexpansion

rem 定义包含数据的字符串变量
set "data="

rem 读取文本文件的每一行
for /f "usebackq tokens=* delims=" %%a in (skipList.txt) do (
    set "line=%%a"
    rem 检查行是否以 # 开头，如果是则跳过（认为是注释）
    if "!line:~0,1!" NEQ "#" (
        rem 连接每行的数据，用分号分隔
        if defined data (
            set "data=!data!;!line!"
        ) else (
            set "data=!line!"
        )
    )
)

rem 将最终的数据结果复制到系统剪贴板
echo !data! | clip

echo format done
echo check ur clickboard
pause
