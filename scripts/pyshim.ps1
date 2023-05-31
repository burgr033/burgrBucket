param($dir,[switch]$noconsole)

$pyex = "python"

if ($noconsole){
    $pyex = "pythonw"
}

ls "$dir" | ? name -match '^[^_].*?\.py$' | % {
    $n = $_.name -replace '\.py$', ''
    $ps = "$dir\$n.ps1"
    "& $pyex `"`$PSScriptRoot\$n.py`" @args" > $ps
}
