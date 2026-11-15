# Lab 01 — Terminal Findings

**Lab:** Kali Linux Fundamentals
**Environment:** `techbiz-lab`
**User:** `student`
**Working Directory:** `/home/student`
**Status:** Completed (13/13 tasks)

## 1. Filesystem Navigation

### Command: `pwd`

Identified the current working directory.

**Output:**

```text
/home/student
```

### Command: `ls -la`

Listed directory contents, including hidden files, permissions, ownership, and file sizes.

**Findings:**

* `docs/` — directory
* `tools/` — directory
* `notes.txt` — text file
* `.bashrc` — hidden shell configuration file

## 2. Reading Files

### Command: `cat notes.txt`

Read the contents of `notes.txt` without opening a text editor.

**Output:**

```text
Getting started on Kali

Everything is a file. Permissions decide who may read or change it.

TBS{linux_is_the_foundation}
```

**Finding:** Retrieved the lab flag from the notes file.

## 3. User Identification

### Command: `whoami`

Identified the currently logged-in user.

**Output:**

```text
student
```

### Command: `id`

Inspected the user's UID, GID, and group memberships.

**Output:**

```text
uid=1000(student) gid=1000(student) groups=1000(student),27(sudo)
```

**Finding:** The student account belongs to the `sudo` group.

## 4. Filesystem Searching

### Command: `find / -name "*.conf"`

Attempted to locate files with the `.conf` extension across the filesystem.

**Output:**

```text
(no matches)
```

**Finding:** No matching configuration files were returned by the simulated environment.

### Command: `grep -r TBS /home/student`

Recursively searched files under `/home/student` for the string `TBS`.

**Output:**

```text
/home/student/notes.txt:TBS{linux_is_the_foundation}
```

**Finding:** Successfully located the flag using a recursive content search.

## 5. File Permissions

### Command: `ls -l /opt`

Inspected file permissions and ownership within `/opt`.

**Output:**

```text
-rwxrwxrwx 1 root root 154 Aug 27 09:00 backup.sh
```

**Finding:**

* File: `backup.sh`
* Owner: `root`
* Group: `root`
* Permissions: `777`
* Security concern: All users have read, write, and execute permissions.

**Security implication:** World-writable scripts can be modified by other users. If such a script is executed with elevated privileges, it could introduce a privilege-escalation risk.

## 6. Process Inspection

### Command: `ps aux`

Listed running processes.

**Relevant findings:**

| User    |  PID | Process      |
| ------- | ---: | ------------ |
| root    |    1 | `/sbin/init` |
| root    |  412 | `sshd`       |
| root    |  640 | `apache2`    |
| student | 1188 | `-bash`      |
| student | 1240 | `ps aux`     |

**Observation:** SSH and Apache were running as root-owned processes in the displayed process list.

## 7. Network Port Inspection

### Command: `ss -tlnp`

Inspected listening TCP ports and their associated processes.

**Findings:**

| Port | Local Address | Process    | Service |
| ---- | ------------- | ---------- | ------- |
| 22   | `0.0.0.0`     | `sshd`     | SSH     |
| 80   | `0.0.0.0`     | `apache2`  | HTTP    |
| 3306 | `127.0.0.1`   | `mariadbd` | MariaDB |

**Security observations:**

* Port 22 was listening on all IPv4 interfaces.
* Port 80 was listening on all IPv4 interfaces.
* Port 3306 was listening only on the local loopback interface.

The database binding limits direct network access to the service from other hosts, although this alone does not establish the overall security of the database.

## 8. Final Lab Findings

| Item                  | Result                         |
| --------------------- | ------------------------------ |
| Home directory        | `/home/student`                |
| Username              | `student`                      |
| Sudo group membership | Confirmed                      |
| World-writable file   | `/opt/backup.sh`               |
| SSH service           | `sshd`                         |
| HTTP service          | `apache2`                      |
| Database service      | `mariadbd`                     |
| Flag                  | `TBS{linux_is_the_foundation}` |

## 9. Lessons Learned

1. `pwd` and `ls -la` provide a quick overview of the current filesystem location.
2. `cat` is useful for reading smaller files directly from the terminal.
3. `whoami` and `id` help establish the current user's identity and privileges.
4. `find` and `grep` serve different purposes: locating files and searching their contents.
5. World-writable permissions can introduce significant security risks.
6. `ps aux` and `ss -tlnp` help identify running processes and exposed network services.
7. Listening interfaces matter when assessing which services may be reachable remotely.

---

**Conclusion:** Successfully completed the Kali Linux Fundamentals lab (13/13 tasks), demonstrating basic Linux filesystem navigation, user identification, permissions inspection, searching, process management, and network port enumeration.
