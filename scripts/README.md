# Scripts auxiliares

## import-screenshots.sh

Localiza las capturas originales en `~/Pictures`, `~/Desktop` o `~/Downloads`, las copia a las carpetas correctas y les asigna nombres consistentes.

### Solo copiar y revisar

```bash
bash scripts/import-screenshots.sh
```

### Copiar, commit y push automáticamente

```bash
bash scripts/import-screenshots.sh --push
```

El script no modifica las imágenes; únicamente las organiza y renombra.
