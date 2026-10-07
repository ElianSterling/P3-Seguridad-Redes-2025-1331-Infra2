# Troubleshooting

## 1. Intento inicial con SSL-VPN

Se intentó implementar SSL-VPN sobre FGT-02. El servicio era alcanzable en TCP/10443, pero la negociación TLS con el cliente moderno no llegó a completarse correctamente.

Durante el diagnóstico se observaron errores de handshake y comportamiento compatible con una incompatibilidad de protocolos/cifrados del entorno EVAL utilizado.

Por este motivo el diseño final migró a **IPsec Remote Access**, manteniendo el mismo objetivo de seguridad: acceso remoto únicamente a JUMP01.

Las capturas históricas se almacenan en:

```text
screenshots/troubleshooting/
```

Estas imágenes **no representan la configuración final**.

## 2. IPsec no negociaba inicialmente

El VPN Wizard creó propuestas compatibles con las restricciones observadas en el laboratorio:

```text
Phase 1: DES-MD5 / DES-SHA1
Phase 2: DES-MD5 / DES-SHA1
```

FortiClient inicialmente proponía parámetros diferentes, por lo que FortiGate devolvía:

```text
no SA proposal chosen
```

## 3. Ajuste final

Se alinearon ambos extremos.

### FGT-02 - Phase 1

```text
IKEv1
Aggressive Mode
DES-MD5 / DES-SHA1
DH Group 5 y 14
Mode Config
XAuth
```

### FortiClient

```text
Phase 1
  DES/SHA1
  DES/MD5
  DH 5, 14

Phase 2
  DES/SHA1
  DES/MD5
  PFS: Enabled
  DH 14
```

Después del ajuste, el cliente recibió `10.31.60.10` y se instaló correctamente la ruta de split tunnel hacia `10.31.40.2/32`.

## 4. Nota académica

DES y MD5 son algoritmos obsoletos y **no serían una selección recomendada para producción**. Se utilizaron únicamente porque eran las propuestas disponibles/operativas en el entorno de laboratorio EVAL empleado para esta práctica.

En una implementación real se utilizarían suites modernas como AES y SHA-2 con parámetros DH/ECDH apropiados.
