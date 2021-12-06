#!/bin/bash
source /GdACC/Dev/Bin/Despliegue.cfg
source /GdACC/Dev/Bin/Proc/Log.sh
##################################Backup de Carpeta##############################
# Nombre de SubRutina: F_Backup_IWDE						#
# Version de SubRutina: 1							#
# Subversion de SubRutina: 0							#
# INPUT: N/A									#
# OUTPUT: Cabecera del script							#
# Descripcion : rutina inicial del programa que muestra la cabecera del mismo	#
#################################################################################

# Esta funcion realizara el Backup completo de la carpeta actual
function F_Backup_IWDE()
{
LOG_HEADER_BACKUP_IWDE()
    if [ ! -d $FolderBackup ] ; then
    mkdir -p $FolderBackup
fi;
cp -R $PathOrigen $FolderBackup 1>>${LOG} 2>>${LOGERR}
    echo $dates "#                                                                           #"  1>>${LOG} 2>>${LOGERR}
    echo $dates "# INF # Haciendo Backup de $PathOrigen                   #" 1>>${LOG} 2>>${LOGERR}
    echo $dates "# INF # en $FolderBackup                  #" 1>>${LOG} 2>>${LOGERR}
    echo $dates "#                                                                           #"  1>>${LOG} 2>>${LOGERR}
     #tar -czvf backup-directorio-usuario.tar.gz /home/usuario
     cd $PathOrigen
   tar -cvzf $PathBackup/$FileNameBackup $PathOrigen 1>>${LOG} 2>>${LOGERR}
echo
echo "Backup finished" 1>>${LOG} 2>>${LOGERR}
LOG_FOOTER_BACKUP_IWDE()
}