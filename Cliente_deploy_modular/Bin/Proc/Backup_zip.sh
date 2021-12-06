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
function F_Backup_zip()
{
    if [ ! -d $PathZip ] ; then
    mkdir -p $PathZip
fi;
cp -R $PathZip $PathZipOld 1>>${LOG} 2>>${LOGERR}
    echo $dates "#                                                                           #"  1>>${LOG} 2>>${LOGERR}
    echo $dates "# INF # Haciendo Backup de $PathZip                   #" 1>>${LOG} 2>>${LOGERR}
    echo $dates "# INF # en $PathZipOld                  #" 1>>${LOG} 2>>${LOGERR}
    echo $dates "#                                                                           #"  1>>${LOG} 2>>${LOGERR}
     #tar -czvf backup-directorio-usuario.tar.gz /home/usuario
     cd $PathZip
   mv $PathZip/$FileNameZip $PathZipOld 1>>${LOG} 2>>${LOGERR}
echo
echo "Backup finished" 1>>${LOG} 2>>${LOGERR}
}