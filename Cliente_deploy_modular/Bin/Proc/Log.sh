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

function LOG_FOOTER_MAIN()
{
echo -e $dates "#############################################################################" 
echo -e $dates "#                                                                           #" 
echo -e $dates "#       .-.-------.__  __ __                                _.-^-._    .--. #"  
echo -e $dates "#      (_,         .-:-  -  --._                         .--   _   --. |__| #"  
echo -e $dates "#    ,-o-(        (_,           )                       /     |_|   \\|   | #"  
echo -e $dates "#   (__,-       ,-o-(            )>                    /             \\   | #"  
echo -e $dates "#      (       (__,-             )                    /|     _____    \\  | #"  
echo -e $dates "#       ---._.--._(             )                      |    |==|==|    |  | #"  
echo -e $dates "#          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #"  
echo -e $dates "# ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #"  
echo -e $dates "#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#"  
echo -e $dates "#############################################################################"  
}

function LOG_BODY_MAIN_LOG_NOT_USER()
{
 echo -e $dates "#                                                                           #"
 echo -e $dates "# WRN # Por favor ejecutar con root/sudo                                    #"
 echo -e $dates "#                                                                           #"
}
function LOG_BODY_MAIN_LOG_USER()
{
 echo -e $dates "#                                                                           #"
 echo -e $dates "# INF # Se ejecuta con root/sudo                                            #"
 echo -e $dates "#                                                                           #"
}


function LOG_HEADER_UNZIP()
{
    echo -e $dates "#############################################################################"
}

function LOG_BODY_UNZIP_OK()
{
 echo -e $dates "#                                                                           #" 
 echo -e $dates "# INF # Descopmpresion realizada con exito                                  #"
 echo -e $dates "#                                                                           #"
}

function LOG_BODY_UNZIP_NOOK(){
 echo -e $dates "#                                                                           #"
 echo -e $dates "# ERR # Error al realizar descompresion                                     #"
 echo -e $dates "#                                                                           #"
}

function LOG_FOOTER_UNZIP () {
    echo "$1" # arguments are accessible through $1, $2,...
}

##### BACKUP IWDE
function LOG_HEADER_BACKUP_IWDE()
{
 echo -e $dates "#                                                                           #" 
 echo -e $dates "# INF # Proceso de Backup iniciado                                          #" 
 echo -e $dates "#                                                                           #" 
}

function LOG_BODY_BACKUP_WDE()
{
    echo -e $dates "#                                                                           #"  1>>${LOG} 2>>${LOGERR}
    echo -e $dates "# INF # Haciendo Backup de $PathOrigen                   #" 1>>${LOG} 2>>${LOGERR}
    echo -e $dates "# INF # en $FolderBackup                  #" 1>>${LOG} 2>>${LOGERR}
    echo -e $dates "#                                                                           #"  1>>${LOG} 2>>${LOGERR} 
}

function LOG_FOOTER_BACKUP_IWDE()
{
 echo -e $dates "#                                                                           #" 
 echo -e $dates "# INF # Proceso de Backup Finalizado                                        #" 
 echo -e $dates "#                                                                           #" 
}

function LOG_HEADER_BACKUP_ZIP
{
echo -e $dates "#############################################################################"
}

function LOG_BODY_BACKUP_ZIP
{
  echo -e $dates "#############################################################################"
  
}

function LOG_FOOTER_BACKUP_ZIP
{
    echo -e $dates "#############################################################################"
}

##############CHECK_ACCESS
function LOG_HEADER_CHECK()
{
echo -e $dates "#############################################################################"

}

function LOG_BODY_CHECK()
{
 echo -e $dates "#                                                                           #" 
 echo -e $dates "# INF # Cambio de Permisos a 757 realizado Correctamente                    #" 
 echo -e $dates "# INF # Cambio de usuraio propietario a root Realizado                      #" 
 echo -e $dates "# INF # Cambio de grupo propietario a root Realizado                        #" 
 echo -e $dates "#                                                                           #" 
}

function LOG_FOOTER_CHECK()
{
  echo -e $dates "#############################################################################"
  
}

##########MOVE
function LOG_HEADER_MOVE()
{
echo -e $dates "#############################################################################"

}
function LOG_BODY_MOVE()
{
echo -e $dates "#############################################################################"

}
function LOG_FOOTER_MOVE()
{
echo -e $dates "#############################################################################"

}
