$root = "Music"
$indexFile = "index.md"
$startMarker = "<!-- MUSIC-LIST-START -->"
$endMarker = "<!-- MUSIC-LIST-END -->"

function Get-FolderHtml($path, $relativePath) {
    $html = ""

    # Get subfolders
    $folders = Get-ChildItem -Path $path -Directory | Sort-Object Name
    # Get files
    $files = Get-ChildItem -Path $path -File | Sort-Object Name

    # Add files
    foreach ($file in $files) {
        $filePath = "$relativePath/$($file.Name)".Replace("\", "/")
        $html += "&nbsp;&nbsp;- [$($file.Name)]($filePath)`n"
    }

    # Add subfolders (recursively)
    foreach ($folder in $folders) {
        $subRelative = "$relativePath/$($folder.Name)"
        $html += "<details><summary><b>$($folder.Name)</b></summary>`n"
        $html += Get-FolderHtml -path $folder.FullName -relativePath $subRelative
        $html += "</details>`n"
    }

    return $html
}

# Generate collapsible HTML
$musicHtml = Get-FolderHtml -path $root -relativePath $root

# Read index.md
$content = Get-Content $indexFile -Raw

# Replace content between markers
if ($content -match [regex]::Escape($startMarker) -and $content -match [regex]::Escape($endMarker)) {
    $pattern = "(?s)(.*$startMarker\s*)(.*?)(\s*$endMarker.*)"
    $newContent = [regex]::Replace($content, $pattern, {
        param($m)
        return $m.Groups[1].Value + $musicHtml + $m.Groups[3].Value
    })
    Set-Content $indexFile $newContent -Encoding UTF8
    Write-Host "✅ Updated $indexFile with collapsible folder structure."
} else {
    Write-Host "⚠️ Could not find both start and end markers in $indexFile."
    Write-Host "   Please add these two lines where you want the list to go:"
    Write-Host "   $startMarker"
    Write-Host "   $endMarker"
}