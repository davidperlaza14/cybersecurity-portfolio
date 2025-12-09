# PENTEST REPORT - DAY 1

**Fecha:** 2025-12-09\
**Objetivo:** Metasploitable2 (192.168.42.129)\
**Analista:** David Stiven Perlaza

## RESUMEN EJECUTIVO

Durante el reconocimiento y análisis inicial del objetivo
**Metasploitable2**, se identificó una vulnerabilidad crítica en el
servicio **vsftpd 2.3.4**, versión conocida por incluir una *backdoor*
intencional introducida en 2011.\
Esta vulnerabilidad permite obtener **acceso remoto con privilegios
root**, comprometiendo completamente el sistema.

El vector de compromiso consiste en ingresar un usuario con un sufijo
`:)`, lo cual activa el *trigger* del backdoor, abriendo una shell en el
puerto 6200.\
La criticidad se considera **CRÍTICA** debido a la facilidad de
explotación y la severidad del impacto.

## HALLAZGO CRÍTICO

### 🔥 Vulnerabilidad Crítica: Backdoor en vsftpd 2.3.4

-   **Servicio:** vsftpd\

-   **Versión:** 2.3.4\

-   **Puerto:** 21/TCP\

-   **Vulnerabilidad:** Backdoor Command Execution\

-   **Exploit identificado:**

    -   *unix/remote/17491.rb*\
    -   *unix/remote/49757.py*\

-   **Descripción:**\
    Esta versión contiene una puerta trasera que permite obtener una
    shell remota al ingresar un nombre de usuario terminado en `:)`.\

-   **Impacto:** Compromiso total. Ejecución remota de comandos como
    **root**.\

-   **Complejidad de explotación:** Baja\

-   **Autenticación requerida:** No\

-   **Evidencia:**

        vsftpd 2.3.4 - Backdoor Detected
        Trigger: USER test:)
        Opens shell on TCP/6200

## OTROS HALLAZGOS RELEVANTES

### ⚙️ Apache 2.2.8 (Puerto 80)

-   Versión obsoleta.\
-   Múltiples vulnerabilidades históricas según base de datos (DOS, path
    traversal, LFI, leakage, etc).\
-   Directorios expuestos: `/doc/`, `/icons/`, `/test/`\
-   `phpinfo.php` accesible (fuga de información crítica).\
-   Métodos peligrosos habilitados: **TRACE**\
-   Exposición a vulnerabilidades como:
    -   Directory Index Disclosure\
    -   WebDAV Issues\
    -   mod_negotiation Multiviews Misconfiguration

### 🖥️ Samba 3.0.20-Debian (Puertos 139/445)

-   Versiones Samba 3.x presentan múltiples exploits con impacto desde
    **RCE** hasta **DoS**.\
-   Potencial vulnerabilidad relevante:\
    **Samba 3.0.20 \< 3.0.25rc3 - Username map script RCE
    (CVE-2007-2447)**\
    → Produce ejecución remota de comandos.\
-   SMB sin firma habilitada (inseguro).

## RECOMENDACIONES

### 🟥 Prioridad: Crítica -- Acción Inmediata

1.  **Actualizar vsftpd inmediatamente** (NO usar 2.3.4).\
2.  **Deshabilitar temporalmente el servicio FTP** si no es necesario.\
3.  **Implementar firewall restrictivo**, bloqueando accesos al puerto
    21 y 6200.

### 🟧 Prioridad: Alta

4.  Actualizar o desinstalar **Apache 2.2.8**.\
5.  Restringir accesos a directorios expuestos.\
6.  Deshabilitar **HTTP TRACE**.\
7.  Restringir acceso a **phpinfo.php**.

### 🟨 Prioridad: Media

8.  Actualizar Samba.\
9.  Habilitar firma SMB.\
10. Implementar monitoreo y logging detallado.

## CONCLUSIÓN

El objetivo presenta múltiples vulnerabilidades debido a versiones
antiguas y configuraciones débiles.\
La presencia del **backdoor en vsftpd 2.3.4** compromete completamente
la seguridad del sistema.\
Se requiere una actualización urgente y un proceso de *hardening*
completo.
