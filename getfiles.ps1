Get-ChildItem -Path ".\arrangements" -Directory | ForEach-Object {
    Get-ChildItem -Path $_.FullName -Name | 
    Where-Object { $_ -notmatch '\.(html|txt|ps1|json)$' } | 
    Out-File -FilePath (Join-Path $_.FullName "filelist.txt") -Encoding utf8
}