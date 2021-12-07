#!/bin/bash
if [[ "$#" -ne 2 ]]; then
echo "Para ejecutar el script"
echo "se deben para la carpeta"
echo "como primer parametro"
echo "y el archivo .zip como"
echo "segundo paramentro"
exit 1
fi
# $1 carpeta de la web.
# $2 nombre del archivo zi
Path_www=/var/www/html
Path_opt=/opt/genesys
Path_zip=$Path_opt/zip
Path_log=/var/log/genesys
Path_Hist=$Path_opt/Historico
Folder_Destino=$1 # InteractionWorkspace o InteractionWorkspace_Prepro
File_zip=$Path_zip/$2
Fecha=$(date +'%Y%m%d')
#dates=$(date +'%Y-%m-%d--%H%M%S')
UPAC=x001357
UEST=x001356
UHOR=x002492
Host=$(hostname -s)
perm=775
#backup de lo actua
log=$Path_log/$Folder_Destino/Deploy-$Fecha.log
logerr=$Path_log/$Folder_Destino/Deploy-error-$Fecha.log
if [ -e $Path_www/$Folder_Destino ]; then
    if [ -e $Path_Hist ]; then
        msg_hist="Se puede realizar la copia de seguridad" 
        Valida_Bkp=1
        echo "validabkp1"
    else
        msg_hist="No existe la carpeta Historico en $Path_opt"
        Valida_Bkp=0
        echo "validabkp0"
    fi
    msg_www="Este servidor tiene ClickOnce de PIC"
    Valida_InteractionWorkspace=1
    echo "validaiwde1"
else
    msg_www="Este servidor no tiene ClickOnce de PIC"
    Valida_InteractionWorkspace=0
    echo "validaiwde0"
fi
if [[ "$Valida_Bkp" == 1 && "$Valida_InteractionWorkspace" == 1 ]]; then
 #cabezera_ok() ;
 echo -ne day  "$msg_www " >> $log
   printf  " $(date +'%Y-%m-%d--%H%M%S') $msg_hist" >> $log
   printf  date " Iniciando Backup..." >> $log
   origen=$Path_www/$Folder_Destino
    destino=$Path_Hist/$Folder_Destino$Fecha
    control_origen=$(ls $origen | du -s)
    mv $origen $destino 
    echo dates " # moviendo desde $origen a $destino" >> $log
    control_bkp=$(ls $destino | du -s)
        if [ -e $Path_Hist/$Folder_Destino$Fecha ]; then
            if [ "$control_origen" == "$control_origen" ]; then
               printf  dates " Backup realizado correctamente, control de integridad" >> $log
            else
               printf  dates " Backup corrupto, no continuar " >> $logerr
        pie_ok
                exit 1
            fi       
        else
           printf  dates "Backup no realizado ,no continuar" >> $logerr
          pie_err
            exit 1        
        cd $Path_www
       printf  dates "posicionado en $Path_www" >> $log
       printf  dates "Iniciando descompresion...." >> $log
        unzip $File_zip $Path_ww
       printf  dates "Finalizo la descompresion...." >> $log
        case $Host in
        *pac*)
        user=$UPAC
        msg_site='Implementado en pacheco'
        ;;
        *est*)
        user=$UEST
        msg_site='Implementado en estomba'
        ;;
        *gir*)
        user=$UHOR
        msg_site='Implementado en hornos'
        ;;
        *)      
        ;;
        esac
        chmod -R $perm $Path_www/$Folder_Destino
       printf  dates "$msg_site el cambio de permisos"
        chown -R $user $Path_www/$Folder_Destino
       printf  dates "$msg_site el cambio de owner"
        chgrp -R $user $Path_www/$Folder_Destino
       printf  dates "$msg_site el cambio de grupo"
       pie_ok
    fi      
else
    if [[ $Valida_InteractionWorkspace = 0 || $Valida_Bkp = 0 ]]; then
      printf  dates " ########################################################################### #"\n >> $logerr
       printf  dates " #                                                                           #"\n >> $logerr
       printf  dates " #                 D  E  P  L  O  Y      W  D  E                             #"\n >> $logerr
       printf  dates " #                                                                           #"\n >> $logerr
       printf  dates " ########################################################################### #"\n >> $logerr
       printf  dates " # Desarrollado por: Juan Emilio Maydup            (TM) dates #"\n >> $logerr
       printf  dates " ########################################################################### #"\n >> $logerr
       printf  dates " $msg_www" >> $logerr
       printf  dates " $msg_hist" >> $logerr
       printf  dates " ########################################################################### #"\n >> $logerr
       printf  dates " #                                                                           #"\n >> $logerr
       printf  dates " #       .-.-------.__  __ __                                _.-^-._    .--. #"\n >> $logerr
       printf  dates " #      (_,         .-:-  -  --._                         .--   _   --. |__| #"\n >> $logerr
       printf  dates " #    ,-o-(        (_,           )                       /     |_|   \\|   | #"\n >> $logerr
       printf  dates " #   (__,-       ,-o-(            )>                    /             \\   | #"\n >> $logerr
       printf  dates " #      (       (__,-             )                    /|     _____    \\  | #"\n >> $logerr
       printf  dates " #       ---._.--._(             )                      |    |==|==|    |  | #"\n >> $logerr
       printf  dates " #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #"\n >> $logerr
       printf  dates " # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #"\n >> $logerr
       printf  dates " #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#" >> $logerr
       printf  dates " ########################################################################### #"\n >> $logerr
        exit 1
    
    else
     printf  dates " ########################################################################### #"\n >> $logerr
       printf  dates " #                                                                           #"\n >> $logerr
       printf  dates " #                 D  E  P  L  O  Y      W  D  E                             #"\n >> $logerr
       printf  dates " #                                                                           #"\n >> $logerr
       printf  dates " ########################################################################### #"\n >> $logerr
       printf  dates " # Desarrollado por: Juan Emilio Maydup            (TM) dates #"\n >> $logerr
       printf  dates " ########################################################################### #"\n >> $logerr
       printf  dates " # valida que paso                                                           #"\n >> $logerr
      printf  dates " ########################################################################### #"\n >> $logerr
       printf  dates " #                                                                           #"\n >> $logerr
       printf  dates " #       .-.-------.__  __ __                                _.-^-._    .--. #"\n >> $logerr
       printf  dates " #      (_,         .-:-  -  --._                         .--   _   --. |__| #"\n >> $logerr
       printf  dates " #    ,-o-(        (_,           )                       /     |_|   \\|   | #"\n >> $logerr
       printf  dates " #   (__,-       ,-o-(            )>                    /             \\   | #"\n >> $logerr
       printf  dates " #      (       (__,-             )                    /|     _____    \\  | #"\n >> $logerr
       printf  dates " #       ---._.--._(             )                      |    |==|==|    |  | #"\n >> $logerr
       printf  dates " #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #"\n >> $logerr
       printf  dates " # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #"\n >> $logerr
       printf  dates " #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#" >> $logerr
       printf " dates  ########################################################################### #"\n >> $logerr
        exit 1    
    fi
fi
function pie_err()
{
     printf  dates " ########################################################################### #"\n >> $logerr
       printf  dates " #                                                                           #"\n >> $logerr
       printf  dates " #       .-.-------.__  __ __                                _.-^-._    .--. #"\n >> $logerr
       printf  dates " #      (_,         .-:-  -  --._                         .--   _   --. |__| #"\n >> $logerr
       printf  dates " #    ,-o-(        (_,           )                       /     |_|   \\|   | #"\n >> $logerr
       printf  dates " #   (__,-       ,-o-(            )>                    /             \\   | #"\n >> $logerr
       printf  dates " #      (       (__,-             )                    /|     _____    \\  | #"\n >> $logerr
       printf  dates " #       ---._.--._(             )                      |    |==|==|    |  | #"\n >> $logerr
       printf  dates " #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #"\n >> $logerr
       printf  dates " # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #"\n >> $logerr
       printf  dates " #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#" >> $logerr
       printf  dates " ########################################################################### #"\n >> $logerr
}

function pie_ok()
{
        printf  dates " ########################################################################### #"\n >>$log
       printf  dates " #                                                                           #"\n >>$log
       printf  dates " #       .-.-------.__  __ __                                _.-^-._    .--. #"\n >>$log
       printf  dates " #      (_,         .-:-  -  --._                         .--   _   --. |__| #"\n >>$log
       printf  dates " #    ,-o-(        (_,           )                       /     |_|   \\|   | #"\n >>$log
       printf  dates " #   (__,-       ,-o-(            )>                    /             \\   | #"\n >>$log
       printf  dates " #      (       (__,-             )                    /|     _____    \\  | #"\n >>$log
       printf  dates " #       ---._.--._(             )                      |    |==|==|    |  | #"\n >>$log
       printf  dates " #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #"\n >>$log
       printf  dates " # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #"\n >>$log
       printf  dates " #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#" >>$log
       printf  dates "########################################################################### #"\n >>$log
}
function day
{
    date=$(date +'%Y-%m-%d--%H%M%S')
}
function cabezera_err() 
{
        printf  dates " ########################################################################### #"\n >> $logerr
       printf  dates " #                                                                           #"\n >> $logerr
       printf  dates " #                 D  E  P  L  O  Y      W  D  E                             #"\n >> $logerr
       printf  dates " #                                                                           #"\n >> $logerr
       printf  dates " ########################################################################### #"\n >> $logerr
       printf  dates " # Desarrollado por: Juan Emilio Maydup            (TM) dates #"\n >> $logerr
       printf  dates " ########################################################################### #"\n >> $logerr
}
function cabezera_ok()
{
  printf  dates "#############################################################################"\n >> $log
   printf  dates " #                                                                          #"\n >> $log
   printf  dates " #                 D  E  P  L  O  Y      W  D  E                            #"\n >> $log 
   printf  dates " #                                                                          #"\n >> $log
   printf  dates " ############################################################################"\n >> $log 
   printf  dates " # Desarrollado por: Juan Emilio Maydup            (TM) dates #"\n             >> $log
   printf  dates " ############################################################################"\n >> $log
}