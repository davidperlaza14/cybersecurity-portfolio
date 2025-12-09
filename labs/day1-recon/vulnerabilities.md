# Vulnerabilidades Encontradas - Día 1

1. **vsftpd - 2.3.4**
    *   **Puerto:** 21
    *   **Descripción:** vsftpd 2.3.4 - Backdoor Command Execution. Esta versión contiene un backdoor que permite la ejecución de comandos remotos.
    *   **Severidad:** Alta
    *   **CVE:** Si aplica

2. **Samba - 3.0.20 < 3.0.25rc3**
    *   **Puerto:** 445
    *   **Descripción:** Samba 3.0.20 < 3.0.25rc3 - 'Username' map script. Esta vulnerabilidad permite la ejecución de comandos remotos a través del campo de nombre de usuario.
    *   **Severidad:** Alta
    *   **CVE:** Si aplica

3. **Apache HTTP Server - 2.4.50**
    *   **Puerto:** 80/443
    *   **Descripción:** Apache HTTP Server 2.4.50 - Remote Code Execution. Esta versión es vulnerable a la ejecución remota de código debido a una falla de traversión de ruta.
    *   **Severidad:** Alta
    *   **CVE:** Si aplica
