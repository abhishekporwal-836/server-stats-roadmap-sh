# Server Stats Script

`server-stats.sh` is a simple Linux shell script that reports basic server performance statistics. It shows CPU, memory, disk usage, and lists the top 5 processes by CPU and memory usage.

---

## Features

- Total CPU usage  
- Total memory usage (Used vs Free + percentage)  
- Total disk usage (Used vs Free + percentage)  
- Top 5 processes by CPU usage  
- Top 5 processes by memory usage  

---

## Requirements

- Linux server (Ubuntu, Debian, CentOS, RHEL, Amazon Linux, etc.)  
- Bash shell  
- GNU utilities (`top`, `ps`, `free`, `df`, `bc`) — usually pre-installed  

---

## How to Run

1. Make the script executable:

```bash
chmod +x server-stats.sh
