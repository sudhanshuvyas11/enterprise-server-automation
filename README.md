# Enterprise Server Automation & Recovery Suite ⚙️☁️

This repository contains production-grade Bash scripts and automation configurations designed to proactively monitor, maintain, and secure Linux-based cloud infrastructure.

## 📌 Module 1: Autonomous Health Monitoring

### Overview
In a scalable enterprise environment, manual server auditing is inefficient. This module introduces a lightweight, dependency-free monitoring pipeline that automatically logs critical system vitals (Memory, Disk, and CPU Load) at regular intervals using native Linux utilities.

### Architecture & Directory Structure
The suite is designed to reside in the `/opt/` directory, adhering to standard Linux hierarchy for custom enterprise software packages.

```text
/opt/server-suite/
│
├── scripts/
│   └── health_check.sh    # Core executable script for metric collection
│
├── logs/
│   └── system_health.log  # Output destination for autonomous audits
│
└── backups/               # (Upcoming: Disaster recovery storage)
Core Technologies Used
Data Parsing: awk for extracting specific system metrics.

Stream Redirection: >> for continuous log appending without data loss.

Automation: System cron daemon for scheduled execution.

Native Utilities: free, df, uptime.

Deployment Instructions
Setup Directory Structure:

Bash
sudo mkdir -p /opt/server-suite/{scripts,logs,backups}
sudo chmod -R 750 /opt/server-suite/
Deploy the Script:
Place health_check.sh into the /scripts directory and grant execution rights:

Bash
sudo chmod +x /opt/server-suite/scripts/health_check.sh
Automate via Cron:
Add the following rule to the root crontab (sudo crontab -e) to execute the audit every 5 minutes:

Bash
*/5 * * * * /opt/server-suite/scripts/health_check.sh
Note: This is Part 1 of an ongoing infrastructure build series. Upcoming modules will feature EBS volume mounting and automated disaster recovery.
