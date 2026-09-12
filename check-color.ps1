$content = Get-Content public\main.js -Raw
$index = $content.IndexOf('208, 34, 34')
if ($index -ge 0) {
    $start = [Math]::Max(0, $index - 60)
    $content.Substring($start, 150)
} else {
    "NOT FOUND"
}