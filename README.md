# 🔐 FortiGate Backup Automation Suite

**Enterprise-grade automation system for FortiGate configuration backups with FTP integration, retention management, and email notification.**

---

## 📌 Overview

This project provides a complete automated solution for managing FortiGate firewall backups in a production environment.

It integrates:

* FortiGate Automation Stitch (backup generation)
* FTP Server (centralized storage)
* Windows Task Scheduler (processing layer)
* PowerShell Scripts (rotation and email notification)

---

## 🚀 Key Features

* 📅 Automated daily backup generation
* 📡 FTP-based centralized storage
* ♻️ Backup rotation with retention policy
* 📧 Automated email notification with latest backup
* 📜 Structured logging and monitoring
* 🔐 Secure and scalable design

---

## 🔄 Complete Automation Workflow

1. **FortiGate Automation Stitch**

   * Generates daily configuration backup

2. **FTP Storage Layer**

   * Backup is uploaded to a centralized FTP server

3. **Windows Task Scheduler**

   * Executes rotation and email scripts

4. **PowerShell Automation**

   * Cleans old backups
   * Sends latest backup via email

---

## 🧠 Architecture Overview

```
FortiGate → FTP Server → Windows Scheduler → Rotation → Email Notification
```

---

## 📁 Project Structure

```
fortigate-backup-automation-suite/
│
├── fortigate/
│   └── automation-stitch.md
│
├── scripts/
│   ├── rotate_backup.ps1
│   └── send_backup_mail.ps1
│
├── scheduler/
│   ├── rotate_backup_task.xml
│   └── backup_mail_task.xml
│
└── README.md
```

---

## ⚙️ Setup Instructions

### 1️⃣ FortiGate Configuration

Follow the guide:

👉 `fortigate/automation-stitch.md`

---

### 2️⃣ FTP Server Setup

* Configure FTP server for backup storage
* Ensure connectivity from FortiGate
* Use secure credentials

---

### 3️⃣ Windows Scheduler Setup

Import tasks:

* `scheduler/rotate_backup_task.xml`
* `scheduler/backup_mail_task.xml`

---

### 4️⃣ Script Configuration

Update backup path:

```powershell
$BackupPath = "C:\Backups\FortiGate"
```

Ensure:

* Backup directory exists
* Proper permissions are configured

---

## 📊 Sample Output

```
Backup archived successfully: FortiGate_01-01-2026_09-03.conf
Old backups cleaned (30-day retention)
Email sent successfully
```

---

## 🔐 Security Considerations

* Do not expose FTP credentials
* Do not upload real configuration files
* Store sensitive data securely
* Restrict access to backup storage

---

## 🎯 Key Highlights

* Fully automated backup lifecycle
* Production-ready architecture
* Clean separation of responsibilities
* Scalable and maintainable design

---

## 🚀 Future Enhancements

* SFTP / FTPS support
* Cloud integration (AWS / Azure)
* Backup integrity validation
* Real-time alerting

---

## 👨‍💻 Author

Built by a system administrator working on real-world network infrastructure and automation.

---

## ⭐ Support

If you find this project useful, consider giving it a star ⭐

---
