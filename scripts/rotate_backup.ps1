# =========================
# FortiGate Backup Versioning Script
# =========================

$basePath = "YOUR PATH"
$src = Join-Path $basePath "fortigate_backup.conf"
$date = Get-Date -Format "dd-MM-yyyy_HH-mm"
$dest = Join-Path $basePath "FortiGate_$date.conf"
$logFile = Join-Path $basePath "backup_rotation.log"

# Ensure backup directory exists
if (!(Test-Path $basePath)) {
    New-Item -ItemType Directory -Path $basePath | Out-Null
}

# Check source file
if (!(Test-Path $src)) {
    Add-Content $logFile "$(Get-Date) ❌ Source backup file not found"
    exit 1
}

# Check file size (avoid empty backup)
$fileSizeKB = (Get-Item $src).Length / 1KB
if ($fileSizeKB -lt 10) {
    Add-Content $logFile "$(Get-Date) ❌ Backup file too small ($fileSizeKB KB) – possible failure"
    exit 1
}

# Copy backup with timestamp
Copy-Item $src $dest -Force

# Verify copy
if (Test-Path $dest) {
    Add-Content $logFile "$(Get-Date) ✅ Backup archived successfully: $(Split-Path $dest -Leaf)"
} else {
    Add-Content $logFile "$(Get-Date) ❌ Backup copy failed"
    exit 1
}

# Retention: keep only last 30 days
Get-ChildItem $basePath -Filter "FortiGate_*.conf" |
Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } |
Remove-Item -Force

Add-Content $logFile "$(Get-Date) 🧹 Old backups cleaned (30-day retention)"
