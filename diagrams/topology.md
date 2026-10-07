# Topología - Infraestructura 2

```mermaid
flowchart LR
    EXT["P3-WIN-CLIENT<br/>192.168.1.79<br/>VPN: 10.31.60.10"] -->|"IPsec Remote Access"| FGT["FGT-02<br/>port1: 192.168.1.82"]

    SW["USERS / VLAN10<br/>10.31.10.0/25"] --> FGT

    FGT -->|"port3<br/>10.31.40.1/29"| JUMP["JUMP01<br/>10.31.40.2/29"]
    FGT -->|"port4<br/>10.31.50.1/29"| WEB["WEB-CAJA<br/>10.31.50.2/29"]

    JUMP -->|"HTTPS / RDP / SSH"| WEB
    SW -. "DENY" .-> WEB
    EXT -. "NO DIRECT ACCESS" .-> WEB
```

## Principio de diseño

El acceso administrativo remoto sigue el recorrido:

```text
P3-WIN-CLIENT -> IPsec -> FGT-02 -> JUMP01 -> WEB-CAJA
```

No existe un flujo autorizado directo:

```text
P3-WIN-CLIENT -> WEB-CAJA
```

ni:

```text
VLAN10-USERS -> WEB-CAJA
```
