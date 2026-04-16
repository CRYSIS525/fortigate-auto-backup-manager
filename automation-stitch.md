# 🔐 FortiGate Automation – Backup Configuration Guide

## 📌 Overview

This document describes the configuration of automated daily backups on FortiGate using **Automation Stitch**, integrated with an external backup processing system.

The solution ensures:

* Automated configuration backups
* Centralized storage via FTP
* Integration with external rotation and notification systems

---

## ⚙️ Automation Workflow

1. FortiGate generates a configuration backup
2. Backup is uploaded to an FTP server
3. Windows-based automation:

   * Performs backup rotation (cleanup)
   * Sends email notification

---

## 🧩 Step-by-Step Configuration

### 1️⃣ Create Backup Action

Navigate to:

**Security Fabric → Automation → Actions**

* Click **Create New**

* Set:

  * **Action Type:** CLI Script
  * **Name:** `Auto_Backup_Config`

* Add the following script:

```bash
execute backup config ftp backup.conf <FTP_IP> <USERNAME> <PASSWORD>
```

* Click **OK / Save**

---

### 2️⃣ Create Automation Trigger

Navigate to:

**Security Fabric → Automation → Triggers**

* Click **Create New**

* Set:

  * **Name:** `Daily_Backup_Trigger`
  * **Type:** Scheduled
  * **Time:** 09:00 AM (Daily)

* Click **OK / Save**

---

### 3️⃣ Create Automation Stitch

Navigate to:

**Security Fabric → Automation → Stitches**

* Click **Create New**

* Set:

  * **Name:** `Daily_Backup_Stitch`
  * **Trigger:** `Daily_Backup_Trigger`
  * **Action:** `Auto_Backup_Config`

* Enable the stitch

---

## 📡 FTP Integration

FortiGate uploads backup files to a centralized FTP server.

### Workflow:

* Backup generated on FortiGate
* File transferred to FTP server
* External system accesses backup for:

  * Rotation
  * Reporting

### Benefits:

* Centralized storage
* Easy automation integration
* Separation of concerns (Firewall vs Processing)

---

## 🔄 Complete Automation Flow

```
FortiGate → FTP Server → Windows Scheduler → Rotation → Email Notification
```

---

## 🔐 Security Considerations

* Do not expose FTP credentials in public repositories
* Restrict access to FTP server
* Use secure password policies
* Store sensitive data outside scripts (environment variables preferred)

---

## 📊 Outcome

* Fully automated daily backup lifecycle
* Zero manual intervention
* Improved disaster recovery readiness
* Clean and maintainable infrastructure

---

## ⚠️ Important Note

Replace the following placeholders with your actual values:

* `<FTP_IP>`
* `<USERNAME>`
* `<PASSWORD>`

Never commit real credentials to version control systems.

---

## 🚀 Future Enhancements

* Secure FTP (SFTP/FTPS) support
* Cloud storage integration
* Backup integrity validation
* Real-time alerting system

---
