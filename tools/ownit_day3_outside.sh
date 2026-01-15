#!/bin/bash
# OWN-IT OUTSIDE v1.0 – ataca solo lo que está expuesto
IP=$1
echo "[+] Samba shares (expuestas)..."
smbclient -L //"$IP" -N 2>/dev/null | grep "Disk" && echo "[+] Samba OWNED" || echo "[-] Samba cerrado"

echo "[+] Quick port check (top 10)..."
nmap -Pn --top-ports 10 "$IP" | grep "open"
