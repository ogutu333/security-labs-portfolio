# 01 — Linux Filesystem Navigation

**Lab:** Kali Linux Fundamentals
**Category:** Linux Command-Line Fundamentals
**Environment:** `techbiz-lab`
**Difficulty:** Beginner

## 1. Overview

Filesystem navigation is one of the first skills required when working with Linux.

In cybersecurity, analysts regularly navigate directories to locate configuration files, inspect system information, investigate suspicious files, and access logs or other security-related artefacts.

This section covers three essential commands:

* `pwd` — identify the current working directory.
* `ls` — list directory contents.
* `cd` — navigate between directories.

## 2. Understanding the Linux Filesystem

Linux uses a hierarchical filesystem structure.

At the top is the root directory (`/`), which contains system directories, user directories, configuration files, and other resources.

The home directory for the simulated lab user was:

```text
/home/student
```

Some commonly encountered Linux directories include:

| Directory | Purpose                                        |
| --------- | ---------------------------------------------- |
| `/`       | Root of the filesystem.                        |
| `/home`   | Contains users' home directories.              |
| `/root`   | Home directory of the root user.               |
| `/etc`    | System configuration files.                    |
| `/var`    | Variable data, including logs.                 |
| `/tmp`    | Temporary files.                               |
| `/opt`    | Optional software and additional applications. |
| `/bin`    | Essential user commands.                       |

## 3. Commands and Practical Examples

### 3.1 `pwd` — Print Working Directory

**Purpose:** Displays the full path of the directory you are currently working in.

**Syntax:**

```bash
pwd
```

**Lab execution:**

```bash
student@techbiz-lab:~$ pwd
/home/student
```

**Observation:**

The command confirmed that the current working directory was `/home/student`.

**Cybersecurity application:**

Before running commands during an investigation, it is important to understand your current location. This helps prevent accidental operations on the wrong files or directories.

### 3.2 `ls` — List Directory Contents

**Purpose:** Displays files and directories within a specified location.

**Basic syntax:**

```bash
ls
```

Useful variations include:

| Command   | Purpose                                          |
| --------- | ------------------------------------------------ |
| `ls`      | Lists visible files and directories.             |
| `ls -l`   | Displays detailed file information.              |
| `ls -a`   | Includes hidden files.                           |
| `ls -la`  | Combines detailed information with hidden files. |
| `ls /etc` | Lists contents of a specific directory.          |

**Lab execution:**

```bash
ls -la
```

**Relevant output:**

```text
docs/
tools/
notes.txt
.bashrc
```

**Observation:**

The command revealed four entries:

* `docs/` and `tools/` were directories.
* `notes.txt` was a regular text file.
* `.bashrc` was a hidden shell configuration file.

The `-a` option was particularly useful because it revealed `.bashrc`, which would not normally appear with a basic `ls` command.

**Cybersecurity application:**

During system reconnaissance, `ls -la` can help identify hidden files, unusual directory contents, file ownership, and potentially suspicious permissions.

### 3.3 `cd` — Change Directory

**Purpose:** Changes the current working directory.

**Syntax:**

```bash
cd directory_name
```

Useful variations:

| Command   | Purpose                                        |
| --------- | ---------------------------------------------- |
| `cd /etc` | Navigate to `/etc`.                            |
| `cd ..`   | Move one directory level up.                   |
| `cd ~`    | Navigate to the current user's home directory. |
| `cd /`    | Navigate to the root directory.                |
| `cd -`    | Return to the previous working directory.      |

**Practical example:**

```bash
cd /etc
pwd
```

Expected output:

```text
/etc
```

**Cybersecurity application:**

An analyst may need to navigate between system directories, user folders, log locations, and application directories when investigating a Linux machine.

## 4. Absolute vs Relative Paths

Linux supports two common ways of specifying file and directory locations.

**Absolute path:** Specifies the complete location starting from the root directory.

Example:

```bash
cd /home/student/docs
```

**Relative path:** Specifies a location in relation to the current working directory.

Example, assuming you are already in `/home/student`:

```bash
cd docs
```

Understanding the difference helps avoid navigation errors when working across multiple directories.

## 5. Key Takeaways

* `pwd` identifies your current working directory.
* `ls` displays directory contents.
* `ls -la` reveals hidden files and detailed file information.
* `cd` allows movement between directories.
* Absolute paths begin at `/`, while relative paths depend on your current location.

## 6. Commands Quick Reference

```bash
pwd
ls
ls -la
ls -l
ls -a
cd /etc
cd ..
cd ~
cd /
cd -
```

## 7. Lab Status

**Completed:** Practised `pwd` and `ls -la` in the simulated environment.

**Additional reference:** Documented useful `cd` variations and navigation examples for continued practice.

**Next:** [02 — Reading Files](reading-files.md)
