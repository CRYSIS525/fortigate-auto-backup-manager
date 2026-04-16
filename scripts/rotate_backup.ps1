# ============================================
# FortiGate Backup Rotation Script
# ============================================

$BackupPath = "C:\Backups\FortiGate"
$RetentionDays = 30

Write-Output "Starting backup cleanup..."

Get-ChildItem -Path $BackupPath -Filter *.conf |
Where-Object {
    $_.LastWriteTime -lt (Get-Date).AddDays(-$RetentionDays)
} |
ForEach-Object {
    Write-Output "Deleting old backup: $($_.Name)"
    Remove-Item $_.FullName -Force
}

Write-Output "Backup cleanup completed."
