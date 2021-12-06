#!/bin/bash
source ./Despliegue.cfg
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
function LOG_FOOTER_UNZIP () {
    echo "$1" # arguments are accessible through $1, $2,...
}
function LOG_FOOTER_BACKUP_IWDE()
{
 echo -e $dates "#                                                                           #" 
 echo -e $dates "# INF # Proceso de Backup Finalizado                                        #" 
 echo -e $dates "#                                                                           #" 
}
function LOG_FOOTER_BACKUP_ZIP
{
    echo -e $dates "#############################################################################"
}
function LOG_FOOTER_CHECK()
{
  echo -e $dates "#############################################################################"
 }
function LOG_FOOTER_MOVE()
{
echo -e $dates "#############################################################################"
}
