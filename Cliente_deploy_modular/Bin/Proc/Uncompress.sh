#!/bin/bash
source /GdACC/Bin/Despliegue.cfg
##################################Backup de Carpeta##############################
# Nombre de SubRutina: F_Backup							#
# Version de SubRutina: 1							#
# Subversion de SubRutina: 0							#
# INPUT: N/A									#
# OUTPUT: Cabecera del script							#
# Descripcion : rutina inicial del programa que muestra la cabecera del mismo	#
#################################################################################
function Descomprimir_wde()
{
    echo $FileNameZip
    echo $PathZip
    echo $PathTmp
   unzip -v $PathZip$FileNameZip -d $PathTmp 1>>"${LOG}" 2>>"${LOGERR}"
#capturar error de unzip 
#y segun sea exitoso o error printear mensaje
if unzip : then
F_UNZIP_OK()  1>>"${LOG}" 2>>"${NULL}"
return 0
else
F_UNZIP_NOOK()  1>>"${LOGERR}"2>>"${NULL}"
return 1
fi
}