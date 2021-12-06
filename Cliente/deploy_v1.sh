#!/usr/bin/env bas
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
dates=$(date +'%Y-%m-%d--%H%M%S')
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
    else
        msg_hist="No existe la carpeta Historico en $Path_opt"
        Valida_Bkp=1
    fi
    msg_www="Este servidor tiene ClickOnce de PIC"
    Valida_InteractionWorkspace=0
else
    msg_www="Este servidor no tiene ClickOnce de PIC"
    Valida_InteractionWorkspace=0
fi
if [[ $Valida_Bkp==1 || $Valida_InteractionWorkspace==1 ]]; then
{
   printf  "$dates #############################################################################" >> $log
   printf  "$dates #                                                                           #" >>$log
   printf  "$dates #                 D  E  P  L  O  Y      W  D  E                             #" >>$log 
   printf  "$dates #                                                                           #" >>$log
   printf  "$dates #############################################################################" >> $log 
   printf  "$dates # Desarrollado por: Juan Emilio Maydup            (TM) $dates #" >>$log
   printf  "$dates #############################################################################" >> $log
   printf  "$dates $msg_www" >> $log
   printf  "$dates $msg_hist" >> $log
   printf  "$dates Iniciando Backup..." >> $log
    control_origen=$(ls $Path_www/$Folder_Destino | du -s)
    origen=$Path_www/$Folder_Destino
    destino=$Path_Hist/$Folder_Destino$Fecha
    mv $origen $destino 
    echo "$dates # moviendo desde $origen a $destino" >> $log
    control_bkp=$(ls $Path_Hist/$Folder_Destino$Fecha | du -s)
        if [ -e $Path_Hist/$Folder_Destino$Fecha ]; then
            if [ "$control_origen" == "$control_origen" ]; then
               printf  "$dates Backup realizado correctamente, control de integridad" >> $log
            else
               printf  "$dates Backup corrupto, no continuar " >> $logerr
               printf  "$dates #############################################################################" >> $log
               printf  "$dates #                                                                           #" >>$log
               printf  "$dates #       .-.-------.__  __ __                                _.-^-._    .--. #" >>$log
               printf  "$dates #      (_,         .-:-  -  --._                         .--   _   --. |__| #" >>$log
               printf  "$dates #    ,-o-(        (_,           )                       /     |_|   \\|   | #" >>$log
               printf  "$dates #   (__,-       ,-o-(            )>                    /             \\   | #" >>$log 
               printf  "$dates #      (       (__,-             )                    /|     _____    \\  | #" >>$log  
               printf  "$dates #       ---._.--._(             )                      |    |==|==|    |  | #" >>$log 
               printf  "$dates #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #" >>$log 
               printf  "$dates # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #" >>$log 
               printf  "$dates #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#" >> $log 
               printf  "$dates #############################################################################" >> $log 
                exit 1
            fi       
        else
           printf  $dates "Backup no realizado ,no continuar" >> $logerr
           printf  "$dates #############################################################################" >> $logerr  
           printf  "$dates #                                                                           #" >> $logerr
           printf  "$dates #       .-.-------.__  __ __                                _.-^-._    .--. #" >> $logerr
           printf  "$dates #      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $logerr
           printf  "$dates #    ,-o-(        (_,           )                       /     |_|   \\|   | #" >> $logerr
           printf  "$dates #   (__,-       ,-o-(            )>                    /             \\   | #" >> $logerr
           printf  "$dates #      (       (__,-             )                    /|     _____    \\  | #" >> $logerr
           printf  "$dates #       ---._.--._(             )                      |    |==|==|    |  | #" >> $logerr
           printf  "$dates #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #" >> $logerr
           printf  "$dates # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #" >> $logerr
           printf  "$dates #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#" >> $logerr
           printf  "$dates #############################################################################" >> $logerr   

        cd $Path_www
       printf  $dates "posicionado en $Path_www" >> $log
       printf  $dates "Iniciando descompresion...." >> $log
        unzip $File_zip $Path_ww
       printf  $dates "Finalizo la descompresion...." >> $log
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
       printf  $dates "$msg_site el cambio de permisos"
        chown -R $user $Path_www/$Folder_Destino
       printf  $dates "$msg_site el cambio de owner"
        chgrp -R $user $Path_www/$Folder_Destino
       printf  $dates "$msg_site el cambio de grupo"
       printf  "$dates #############################################################################" >>$log
       printf  "$dates #                                                                           #" >>$log
       printf  "$dates #       .-.-------.__  __ __                                _.-^-._    .--. #" >>$log
       printf  "$dates #      (_,         .-:-  -  --._                         .--   _   --. |__| #" >>$log
       printf  "$dates #    ,-o-(        (_,           )                       /     |_|   \\|   | #" >>$log
       printf  "$dates #   (__,-       ,-o-(            )>                    /             \\   | #" >>$log
       printf  "$dates #      (       (__,-             )                    /|     _____    \\  | #" >>$log
       printf  "$dates #       ---._.--._(             )                      |    |==|==|    |  | #" >>$log
       printf  "$dates #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #" >>$log
       printf  "$dates # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #" >>$log
       printf  "$dates #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#" >>$log
       printf  "$dates #############################################################################" >>$log
    fi 
}     
else
    if [ $Valida_InteractionWorkspace = 0 or $Valida_Bkp = 0 ]; then
       printf  "$dates #############################################################################" >> $logerr
       printf  "$dates #                                                                           #" >>$logerr
       printf  "$dates #                 D  E  P  L  O  Y      W  D  E                             #" >>$logerr 
       printf  "$dates #                                                                           #" >>$logerr
       printf  "$dates #############################################################################" >> $logerr
       printf  "$dates # Desarrollado por: Juan Emilio Maydup            (TM) $dates #" >>$logerr
       printf  "$dates #############################################################################" >> $logerr
       printf  "$dates $msg_www" >> $logerr
       printf  "$dates $msg_hist" >> $logerr
       printf  "$dates #############################################################################" >> $logerr
       printf  "$dates #                                                                           #" >>$logerr
       printf  "$dates #       .-.-------.__  __ __                                _.-^-._    .--. #" >>$logerr
       printf  "$dates #      (_,         .-:-  -  --._                         .--   _   --. |__| #" >>$logerr
       printf  "$dates #    ,-o-(        (_,           )                       /     |_|   \\|   | #" >>$logerr
       printf  "$dates #   (__,-       ,-o-(            )>                    /             \\   | #" >>$logerr
       printf  "$dates #      (       (__,-             )                    /|     _____    \\  | #" >>$logerr
       printf  "$dates #       ---._.--._(             )                      |    |==|==|    |  | #" >>$logerr
       printf  "$dates #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #" >>$logerr
       printf  "$dates # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #" >>$logerr
       printf  "$dates #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#"  >> $logerr
       printf  "$dates #############################################################################"  >> $logerr
       exit 1
    else
       printf  "$dates #############################################################################" >> $logerr
       printf  "$dates #                                                                           #" >> $logerr
       printf  "$dates #                 D  E  P  L  O  Y      W  D  E                             #" >> $logerr
       printf  "$dates #                                                                           #" >> $logerr
       printf  "$dates #############################################################################" >> $logerr
       printf  "$dates # Desarrollado por: Juan Emilio Maydup            (TM) $dates #" >> $logerr
       printf  "$dates #############################################################################" >> $logerr
       printf  "$dates # valida que paso                                                           #" >> $logerr
       printf  "$dates #############################################################################" >> $logerr
       printf  "$dates #                                                                           #" >> $logerr
       printf  "$dates #       .-.-------.__  __ __                                _.-^-._    .--. #" >> $logerr
       printf  "$dates #      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $logerr
       printf  "$dates #    ,-o-(        (_,           )                       /     |_|   \\|   | #" >> $logerr
       printf  "$dates #   (__,-       ,-o-(            )>                    /             \\   | #" >> $logerr
       printf  "$dates #      (       (__,-             )                    /|     _____    \\  | #" >> $logerr
       printf  "$dates #       ---._.--._(             )                      |    |==|==|    |  | #" >> $logerr
       printf  "$dates #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #" >> $logerr
       printf  "$dates # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #" >> $logerr
       printf  "$dates #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#" >> $logerr
       printf  "$dates #############################################################################" >> $logerr
       exit 1    
    fi
fi