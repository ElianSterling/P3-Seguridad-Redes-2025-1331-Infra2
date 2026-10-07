# Pruebas de validación

## Matriz de pruebas

| Origen | Destino | Servicio | Resultado esperado | Resultado |
|---|---|---|---|---|
| VLAN10 `10.31.10.20` | WEB-CAJA `10.31.50.2` | RDP/3389 | DENY | ✅ |
| VLAN10 `10.31.10.20` | WEB-CAJA `10.31.50.2` | HTTPS/443 | DENY | ✅ |
| JUMP01 `10.31.40.2` | WEB-CAJA `10.31.50.2` | HTTPS/RDP/SSH | ACCEPT | ✅ |
| IPsec client `10.31.60.10` | JUMP01 `10.31.40.2` | RDP/3389 | ACCEPT | ✅ |
| IPsec client | WEB-CAJA `10.31.50.2` | RDP/3389 | DENY / sin ruta VPN | ✅ |
| IPsec client | WEB-CAJA `10.31.50.2` | HTTPS/443 | DENY / sin ruta VPN | ✅ |
| IPsec client | WEB-CAJA `10.31.50.2` | SSH/22 | DENY / sin ruta VPN | ✅ |

## Evidencias clave

### USERS -> WEB bloqueado

```powershell
Test-NetConnection 10.31.50.2 -Port 3389
Test-NetConnection 10.31.50.2 -Port 443
```

Resultado observado:

```text
TcpTestSucceeded : False
```

Captura esperada en:

```text
screenshots/tests/01-users-web-denied.png
```

### VPN establecida

El cliente recibió:

```text
IPv4 Address : 10.31.60.10
```

y Windows instaló la ruta específica:

```text
10.31.40.2  255.255.255.255  ...  10.31.60.10
```

### VPN -> JUMP01

```powershell
Test-NetConnection 10.31.40.2 -Port 3389
```

Resultado:

```text
InterfaceAlias   : Ethernet 3
SourceAddress    : 10.31.60.10
TcpTestSucceeded : True
```

Posteriormente se validó una sesión RDP real.

### VPN -> WEB-CAJA

```powershell
Test-NetConnection 10.31.50.2 -Port 3389
Test-NetConnection 10.31.50.2 -Port 443
Test-NetConnection 10.31.50.2 -Port 22
```

Las tres pruebas resultaron en `TcpTestSucceeded : False`.

## Logging

FortiGate registra:

- `USERS-DENY-WEB` para los intentos desde VLAN10.
- `JUMP-TO-WEB` para el tráfico permitido desde JUMP01.
- La política IPsec para el acceso RDP remoto a JUMP01.
