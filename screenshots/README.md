# Índice de evidencias

Las capturas deben conservarse con nombres descriptivos y agrupadas por función.

## FortiGate

| Archivo | Evidencia |
|---|---|
| `fortigate/01-users-deny-logs.png` | Logs de `USERS-DENY-WEB` |
| `fortigate/02-jump-to-web-allow-logs.png` | Logs permitidos JUMP01 -> WEB-CAJA |
| `fortigate/03-allow-deny-combined-logs.png` | Vista conjunta de tráfico permitido y denegado |
| `fortigate/04-ipsec-rdp-policy.png` | Política IPsec -> JUMP01 por RDP |

## VPN IPsec

| Archivo | Evidencia |
|---|---|
| `vpn/01-ipsec-wizard-remote-access.png` | Selección Remote Access / FortiClient |
| `vpn/02-ipsec-authentication.png` | WAN, PSK y grupo de usuarios |
| `vpn/03-ipsec-policy-routing.png` | JUMP-LAN, HOST-JUMP01 y pool |
| `vpn/04-ipsec-review-settings.png` | Resumen previo a crear |
| `vpn/05-ipsec-created.png` | Confirmación de creación |

## Pruebas

| Archivo | Evidencia |
|---|---|
| `tests/01-users-web-denied.png` | VLAN10 bloqueada hacia WEB-CAJA |
| `tests/02-vpn-web-blocked-rdp-warning.png` | WEB bloqueado desde cliente remoto y RDP hacia JUMP |
| `tests/03-vpn-rdp-jump-success.png` | Sesión RDP real hacia JUMP01 |

## Troubleshooting histórico

Estas imágenes documentan el intento SSL-VPN inicial. No representan el diseño final.

| Archivo |
|---|
| `troubleshooting/01-ssl-vpn-settings-attempt.png` |
| `troubleshooting/02-ssl-vpn-policy-attempt.png` |
| `troubleshooting/03-forticlient-ssl-vpn-attempt.png` |

## Correspondencia con las capturas originales

| Captura original | Nombre final |
|---|---|
| 2026-10-06 16-48-30 | `tests/01-users-web-denied.png` |
| 2026-10-06 16-49-00 | `fortigate/01-users-deny-logs.png` |
| 2026-10-07 15-08-53 | `fortigate/02-jump-to-web-allow-logs.png` |
| 2026-10-07 15-12-18 | `fortigate/03-allow-deny-combined-logs.png` |
| 2026-10-07 15-27-11 | `troubleshooting/01-ssl-vpn-settings-attempt.png` |
| 2026-10-07 15-30-02 | `troubleshooting/02-ssl-vpn-policy-attempt.png` |
| 2026-10-07 16-03-40 | `troubleshooting/03-forticlient-ssl-vpn-attempt.png` |
| 2026-10-07 16-14-59 | `vpn/01-ipsec-wizard-remote-access.png` |
| 2026-10-07 16-16-04 | `vpn/02-ipsec-authentication.png` |
| 2026-10-07 16-19-48 | `vpn/03-ipsec-policy-routing.png` |
| 2026-10-07 16-22-25 | `vpn/04-ipsec-review-settings.png` |
| 2026-10-07 16-23-29 | `vpn/05-ipsec-created.png` |
| 2026-10-07 16-26-43 | `fortigate/04-ipsec-rdp-policy.png` |
| 2026-10-07 18-03-39 | `tests/02-vpn-web-blocked-rdp-warning.png` |
| 2026-10-07 18-03-53 | `tests/03-vpn-rdp-jump-success.png` |
