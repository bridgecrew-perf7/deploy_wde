#!/bin/bash
source /GdACC/Dev/Bin/Despliegue.cfg
source /GdACC/Dev/Bin/Proc/Log.sh
source /GdACC/Dev/Bin/Proc/Backup_IWDE.sh
#source /GdACC/Dev/Bin/Proc/Backup_zip.sh
#source /GdACC/Dev/Bin/Proc/Move.sh
#source /GdACC/Dev/Bin/Proc/Uncompress.sh
source /GdACC/Dev/Bin/Proc/CheckAccess.sh
#################################################################################
# Nombre del Script: Deploy.sh						        #
# Version del Script: 1.0							#
# Fecha de Creacion: 15/05/2020						        #
# Fecha de Ultima Modificacion: 15/05/2020				        #
# Nombre del Autor: Juan Emilio Maydup						#
# Nombre de Revisores : Victor Vera, Santiago Doval				#
#										#
# Descripcion:									#
# Este script tiene como proposito principal desplegar en el equipo una nueva	#
# version del software WDE para la plataforma PIC.	                 	#
# El mismo contara con distintas funciones:				        #
# - Hacer Backup de la carpeta actual productiva.				#
# - Descomprimir el archivo WDE.zip en una carpeta temporal y pasar el archivo	#
#   zip manipulado a una carpeta para mantenerlo por lo menos por 10 versiones.	#
# - Mover el contenido de la carpeta temporal a su ubicacion final.		#
# - Validar los permisos de la nueva carpeta segun los paramentros necesarios y #
#   corregir los mismos aplicando los que requiere la aplicacion.       	#
#								                #
# Historial de Revision :						        #
#   1.0.00 - 15/05/2020 : Version Inicial.                                      #
#################################################################################

function F_MAIN()
{
LOG_HEADER_LOG() 1>>"${LOG}" 2>>"${LOGERR}"
if [ $USER != $UPAC  || $USER != $UEST ]; then
LOG_HEADER_LOG() 1>>"${LOGERR}" 2>>"${NULL}"
LOG_MAIN_LOG_NOT_USER()  1>>"${LOGERR}" 2>>"${NULL}"
LOG_FOOT_LOG()  1>>"${LOGERR}" 2>>"${NULL}"
else
F_Backup_IWDE  1>>"${LOG}" 2>>"${LOGERR}"
#1  renombrar carpeta actual de /var/www/html/InteractionWorkspace a r
#   /var/www/html/Backup-Despliegue-$dates-InteractionWorkspace
#2 descomprimir el archivo WDE.zip en /GdACC/Tmp obteniendo la carpeta InteractionWorkspace
F_UnCompress 1>>"${LOG}" 2>>"${LOGERR}"
    #F_Move
F_Backup_zip
F_CheckAccess 1>>"${LOG}" 2>>"${LOGERR}"
LOG_FOOT_LOG 1>>"${LOG}" 2>>"${LOGERR}"
return 0
fi
}
F_MAIN()

