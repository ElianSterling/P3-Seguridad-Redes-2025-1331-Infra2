# Guía para el video - Infraestructura 2

Objetivo sugerido: **7 a 9 minutos**, manteniéndose por debajo del máximo de 10 minutos.

## 0:00 - 0:40 | Introducción

Explicar brevemente:

- Infraestructura 2.
- FortiGate como punto central.
- VLAN10 de usuarios.
- JUMP01.
- WEB-CAJA.
- VPN IPsec Remote Access.

## 0:40 - 1:30 | Topología y direccionamiento

Mostrar la topología y mencionar:

- USERS: `10.31.10.0/25`
- JUMP-LAN: `10.31.40.0/29`
- WEB-LAN: `10.31.50.0/29`
- Pool VPN: `10.31.60.10-10.31.60.20`

## 1:30 - 2:40 | Políticas de FortiGate

Mostrar:

- `JUMP-TO-WEB`
- `USERS-DENY-WEB`
- `vpn_INFRA2-IPSEC_remote_0`

Resaltar que la VPN solo permite RDP hacia JUMP01.

## 2:40 - 3:30 | Prueba USERS -> WEB

Desde `10.31.10.20`:

```powershell
Test-NetConnection 10.31.50.2 -Port 3389
Test-NetConnection 10.31.50.2 -Port 443
```

Mostrar los `False` y luego los logs `USERS-DENY-WEB`.

## 3:30 - 4:30 | JUMP01 -> WEB-CAJA

Mostrar que JUMP01 está en `10.31.40.2` y los logs de tráfico permitido hacia `10.31.50.2`.

Mencionar que la administración se concentra en el Jump Server.

## 4:30 - 6:00 | VPN IPsec

Mostrar:

- Wizard / configuración IPsec.
- FortiClient.
- Conexión establecida.
- IP VPN `10.31.60.10`.
- Ruta `10.31.40.2/32`.

## 6:00 - 7:15 | Acceso remoto

Ejecutar:

```powershell
Test-NetConnection 10.31.40.2 -Port 3389
```

Mostrar `True` y abrir RDP a JUMP01.

## 7:15 - 8:15 | Prueba de aislamiento VPN

Probar desde el cliente VPN:

```powershell
Test-NetConnection 10.31.50.2 -Port 3389
Test-NetConnection 10.31.50.2 -Port 443
Test-NetConnection 10.31.50.2 -Port 22
```

Mostrar que las tres fallan.

## 8:15 - 9:00 | Cierre

Explicar que:

- La VPN llega a JUMP01.
- WEB-CAJA no es accesible directamente.
- JUMP01 actúa como punto controlado de administración.
- FortiGate registra los accesos permitidos y denegados.
