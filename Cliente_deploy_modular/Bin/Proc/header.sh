#!/bin/bash
source ./Despliegue.cfg
function LOG_HEADER_MAIN()
{
echo -e $dates "#############################################################################" 
echo -e $dates "#                                                                           #" 
echo -e $dates "#                 D  E  P  L  O  Y      W  D  E                             #"  
echo -e $dates "#                                                                           #" 
echo -e $dates "#############################################################################"  
echo -e $dates "# Desarrollado por: Juan Emilio Maydup            (TM) $dates #" 
echo -e $dates "#############################################################################" 
}
function LOG_HEADER_UNZIP()
{
    echo -e $dates "#############################################################################"
}
##### BACKUP IWDE
function LOG_HEADER_BACKUP_IWDE()
{
 echo -e $dates "#                                                                           #" 
 echo -e $dates "# INF # Proceso de Backup iniciado                                          #" 
 echo -e $dates "#                                                                           #" 
}
function LOG_HEADER_BACKUP_ZIP
{
echo -e $dates "#############################################################################"
}
##############CHECK_ACCESS
function LOG_HEADER_CHECK()
{
echo -e $dates "#############################################################################"
}
function LOG_HEADER_MOVE()
{
echo -e $dates "#############################################################################"
}
