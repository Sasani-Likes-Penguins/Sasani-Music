$root = "Music"
$indexFile = "index.md"
$marker = "<!-- MUSIC-LIST -->"

# Generate the file list
$musicList = Get-ChildItem -Path $root -Recurse | ForEach-Object {
    if (-not $_.PSIsContainer) {
        $relative = $_.FullName.Substring((Get-Location).Path.Length + 1).Replace("\", "/")
        $indent = "  " * ($_.FullName.Split("\").Count - $root.Split("\").Count - 1)
        "$indent- [$($_.Name)]($relative)"
    }
}

# Read the existing index.md
$content = Get-Content $indexFile -Raw

# Split the file into the part before and after the marker
if ($content -match "(?s)(.*$marker)") {
    $before = $matches[1]
    $newContent = $before + "`r`n" + ($musicList -join "`r`n")
    Set-Content $indexFile $newContent -Encoding UTF8
    Write-Host "✅ Updated $indexFile with music list."
} else {
    Write-Host "⚠️ Marker not found in $indexFile. Please add '$marker' where you want the list."
}