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

This project implements an end-to-end automated backup pipeline:

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
├── fortigate/        # FortiGate automation configuration guide
│   └── automation-stitch.md
│
├── scripts/          # PowerShell automation scripts
│   ├── rotate_backup.ps1
│   └── send_backup_mail.ps1
│
├── scheduler/        # Windows Task Scheduler configurations
│   ├── rotate_backup_task.xml
│   └── backup_mail_task.xml
│
├── config/           # Sample configuration (no real credentials)
│   └── sample.env
│
├── logs/             # Sample output logs
│   └── sample.log
│
├── requirements.txt
└── README.md
```

---

## ⚙️ Setup Instructions

### 1️⃣ FortiGate Configuration

Follow the detailed guide:

👉 `fortigate/automation-stitch.md`

This includes:

* Creating backup action
* Creating scheduled trigger
* Creating automation stitch

---

### 2️⃣ FTP Server Setup

* Configure FTP server for backup storage
* Ensure access from FortiGate and Windows system
* Use secure credentials

---

### 3️⃣ Windows Scheduler Setup

Import the provided XML tasks:

* `scheduler/rotate_backup_task.xml`
* `scheduler/backup_mail_task.xml`

These will:

* Run backup rotation
* Send email notifications

---

### 4️⃣ Script Configuration

Update paths inside scripts:

```powershell
$BackupPath = "C:\Backups\FortiGate"
```

Ensure:

* Backup directory exists
* Proper permissions are set

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
* Use environment variables for sensitive data
* Restrict access to backup storage

---

## 🎯 Key Highlights

* Fully automated backup lifecycle
* Separation of concerns (Firewall vs Processing)
* Production-ready architecture
* Scalable and maintainable design

---

## 🚀 Future Enhancements

* SFTP / FTPS support
* Cloud backup integration (AWS / Azure)
* Backup integrity validation
* Real-time alerting system

---

## 👨‍💻 Author

Built by a system administrator working on real-world network infrastructure and security automation.

---

## ⭐ Support

If you find this project useful, consider giving it a star ⭐

---
