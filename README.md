# Security Labs Portfolio

A collection of hands-on cybersecurity mini-labs designed to demonstrate my practical understanding of security concepts through **building, testing, detecting, investigating, and documenting security events**.

The labs cover areas including:

* Security Operations & Detection
* Incident Response
* Vulnerability Management
* Network Security
* Web & API Security
* Cloud Security
* Security Automation

> All labs are performed in controlled environments for learning and portfolio development.

---

## Lab 01 — File Integrity Monitoring (FIM)

**Focus:** Linux Security | Detection | Incident Response

This lab demonstrates how **File Integrity Monitoring (FIM)** can detect unauthorized changes to critical files.

I created a simulated web server on Kali Linux, established a trusted SHA-256 baseline, simulated a web defacement, detected the resulting hash mismatch, investigated the modification, restored the affected file, and verified remediation.

### Workflow

```text
Baseline → Simulate Attack → Detect → Investigate → Remediate → Verify
```

### Tools

* Kali Linux
* Bash
* SHA-256
* `find`
* `sha256sum`
* `diff`
* `stat`

📄 **[Incident Report](fim-incident-report.md)**

### Key Takeaway

The lab demonstrates how FIM can help SOC analysts identify unexpected file changes that may indicate **tampering, compromise, or other security events**.
