#!/bin/bash
source /GdACC/Dev/Bin/Despliegue.cfg
source /GdACC/Dev/Bin/Proc/Log.sh
##################################Funcion Header Log#############################
# Nombre de SubRutina: F_CheckAccess                                            #
# Version de SubRutina: 1                                                       #
# Subversion de SubRutina: 0                                                    #
# INPUT: N/A                                                                    #
# OUTPUT: Cabecera del script                                                   #
# Descripcion : Se debe validar los permisos previos a que el Owner y el Group  #
# sean los mismos como asi los permisos de Read , Write , Execute. tanto para   #
# el owner ,group y other                                                       #
#################################################################################
function F_CheckAccess(){
chmod -R 757 $PathOrigen
chown -R root $PathOrigen
chgrp -R root $PathOrigen
F_CHECK_LOG
}
