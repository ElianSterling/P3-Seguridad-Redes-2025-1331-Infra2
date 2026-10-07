# Plan de direccionamiento - Infraestructura 2

## Redes

| Segmento | Red | Máscara | Gateway | Uso |
|---|---|---|---|---|
| VLAN10-USERS | `10.31.10.0/25` | `255.255.255.128` | `10.31.10.1` | Usuarios internos |
| JUMP-LAN | `10.31.40.0/29` | `255.255.255.248` | `10.31.40.1` | Jump Server |
| WEB-LAN | `10.31.50.0/29` | `255.255.255.248` | `10.31.50.1` | Web Server |
| IPSEC-POOL | `10.31.60.0/24` | `255.255.255.0` | Mode Config | Clientes VPN |
| WAN-MGMT | `192.168.1.0/24` | `255.255.255.0` | `192.168.1.1` | Gestión / entrada VPN |

## Hosts relevantes

| Equipo | IP | Segmento | Rol |
|---|---|---|---|
| FGT-02 | `192.168.1.82` | WAN-MGMT | Firewall / VPN |
| CLIENT01 | `10.31.10.20` | VLAN10-USERS | Cliente interno |
| JUMP01 | `10.31.40.2` | JUMP-LAN | Bastion / Jump Server |
| WEB-CAJA | `10.31.50.2` | WEB-LAN | Servidor web |
| P3-WIN-CLIENT | `192.168.1.79` | WAN-MGMT | Cliente remoto |
| P3-WIN-CLIENT VPN | `10.31.60.10` | IPSEC-POOL | Dirección asignada por IPsec |

## Split tunneling

El túnel anuncia únicamente:

```text
10.31.40.2/32  ->  HOST-JUMP01
```

Por diseño, `10.31.50.2` no se anuncia al cliente VPN. El acceso al Web Server debe hacerse desde JUMP01.
