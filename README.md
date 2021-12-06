# Despliegue de WDE

## Lista de pendientes

- [x] Definir listado de Host
- [x] Definir Host Origen
- [x] Definir Hosts Destinos
- [x] Estructura de Carpetas
- [x] Estructura de Scripts
- [ ] Script de ejecucion
  - [x] Script de Backup IWDE
  - [ ] Script de Backup zip
  - [ ] Script de descompresion
  - [ ] Script de Movimiento de zip a zipold
  - [ ] Script de Movimiento de carpeta temporal a definitiva
  - [x] Script de Chequeo de permisos
- [ ] Control de generacion de Log y Errores

## Listado de HOSTS

### Host Origen

- pwpicpacapp1 10.75.161.7

### Destino_Pacheco

- plpicpacapp13 10.75.160.172 --no estoy seguro--
- plpicpacapp14 10.75.160.173
- plpicpacapp15 10.75.160.174
- plpicpacapp16 10.75.160.175
- plpicpacapp17 10.75.160.176
- plpicpacapp18 10.75.160.177
- plpicpacapp19 10.75.160.178
- plpicpacapp20 10.75.160.179
- plpicpacapp21 10.75.160.180
- plpicpacapp22 10.75.160.181
- plpicpacapp23 10.75.160.182
- plpicpacapp24 10.75.160.183
- plpicpacapp25 10.75.160.184
- plpicpacapp26 10.75.160.185
- plpicpacapp27 10.75.160.186
- plpicpacapp28 10.75.160.187
- plpicpacapp29 10.75.160.188
- plpicpacapp30 10.75.160.189

### Destino_Estomba

- plpicestapp13 10.75.160.94
- plpicestapp14 10.75.160.95
- plpicestapp15 10.75.160.96
- plpicestapp16 10.75.160.97
- plpicestapp17 10.75.160.98
- plpicestapp18 10.75.160.99
- plpicestapp19 10.75.160.100
- plpicestapp20 10.75.160.101
- plpicestapp21 10.75.160.102
- plpicestapp22 10.75.160.103
- plpicestapp23 10.75.160.104
- plpicestapp24 10.75.160.105
- plpicestapp25 10.75.160.106
- plpicestapp26 10.75.160.107
- plpicestapp27 10.75.160.108
- plpicestapp28 10.75.160.109
- plpicestapp29 10.75.160.110
- plpicestapp30 10.75.160.111

## Estructura de Carpetas y Archivos

### Estructura de Carpetas

- /GdACC/Bin/
- /GdACC/Bin/Proc/
- /GdACC/Log/
- /GdACC/Zip/
- /GdACC/ZipOld
- /GdACC/Backup

### Estructura de Archivos Shell y Generados (log, Resguardos)

#### Estructura de Archivos Shell

- /GdACC/Bin/Deploy.sh
- /GdACC/Bin/Proc/Backup.sh
- /GdACC/Bin/Proc/Move.sh
- /GdACC/Bin/Proc/Uncompress.sh
- /GdACC/Bin/Proc/CheckAccess.sh

#### Generados (log, Resguardos)

- /GdACC/Log/Despliegue-$HOSTNAME-$Date_log.log
- /GdACC/Zip/WDE.zip
- /GdACC/ZipOld/WDE-Despliegue-$HOSTNAME-$Date_log.zip
- /GdACC/Backup/Backup-Despliegue-$HOSTNAME-$Date_log.tgz

## Script de Ejecucion

- /GdACC/Bin/Deploy.sh

## Script de Backup

- /GdACC/Bin/Proc/Backup_IWDE.sh
- /GdACC/Bin/Proc/Backup_zip.sh

## Script de Descompresion

- /GdACC/Bin/Proc/Uncompress.sh

## Movimiento de Carpeta Temporal a Definitiva

- /GdACC/Bin/Proc/Move.sh

## Script de Chequeo de Permisos

- /GdACC/Bin/Proc/CheckAccess.sh
