@ECHO OFF
REM パッケージテンプレート名
SET TEMPLATE_NAME=PackageTemplate
REM パッケージを格納するフォルダー名
SET FOLDER_NAME=Practice

:INPUT_START
ECHO +------------------------------------------+
ECHO パッケージ名を入力してください。
ECHO +------------------------------------------+

SET /P INPUT_STR=

IF "%INPUT_STR%"=="" GOTO :INPUT_START

:INPUT_CONF
ECHO +------------------------------------------+
ECHO パッケージ名は[%INPUT_STR%]でよろしいですか？
ECHO ( Y / N )
ECHO +------------------------------------------+

SET /P CONF_SELECT=

IF "%CONF_SELECT%"=="Y" (
    GOTO :PACKAGE_COPY
) ELSE (
    ECHO 再度入力してください。
    GOTO :INPUT_START
)

:PACKAGE_COPY
SET CUR_PATH=%~dp0
ECHO %CUR_PATH%

ECHO D | XCOPY /E %CUR_PATH%%TEMPLATE_NAME% %CUR_PATH%%FOLDER_NAME%\%TEMPLATE_NAME%

:PACKAGE_RENAME
SET TARGET_PATH=%CUR_PATH%%FOLDER_NAME%\%TEMPLATE_NAME%

REM nimbleファイルの中身を置換
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "DELIMS=" %%A IN (%TARGET_PATH%\%TEMPLATE_NAME%.nimble) DO (
    SET LINE=%%A

    ECHO !LINE:%TEMPLATE_NAME%=%INPUT_STR%! >> %TARGET_PATH%\%INPUT_STR%.nimble
)

REM 古いnimbleファイルを削除
DEL %TARGET_PATH%\%TEMPLATE_NAME%.nimble

REM ワークスペースファイルをリネーム
REN %TARGET_PATH%\%TEMPLATE_NAME%.code-workspace %INPUT_STR%.code-workspace

REM ソースファイルをリネーム
REN %TARGET_PATH%\src\%TEMPLATE_NAME%.nim %INPUT_STR%.nim

REM パッケージ名をリネーム
REN %TARGET_PATH% %INPUT_STR%

PAUSE