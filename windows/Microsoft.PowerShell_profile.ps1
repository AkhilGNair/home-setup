# Disable the backspace bell
Set-PSReadlineOption -BellStyle None
Import-Module PSReadLine

# Tab complete like bash
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Reverse Search
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

function Set-Env {
    param ( [string]$Suffix )

    $FileName = ".env.win.$Suffix"

    if (Test-Path $FileName) {
        Write-Host ":: Sourcing environment variables from $FileName" -ForegroundColor Green

        $content = Get-Content $FileName | Where-Object { $_ -match '\S' -and $_ -notmatch '^\s*#' }  # Remove empty lines and comments

        if ($content.Count -gt 0) {
            Invoke-Expression ($content -join "`n")
        } else {
            Write-Host ":: No valid environment variables found in $FileName" -ForegroundColor Yellow
        }
    } else {
        Write-Host ":: Env file $FileName not found!" -ForegroundColor Red
    }
}

$configPath = Join-Path (Split-Path -Path $PROFILE) "catppucino_frappe.json"
oh-my-posh init pwsh --config $configPath | Invoke-Expression
