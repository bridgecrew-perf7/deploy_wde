#!/usr/bin/env bash
if [[ "$#" -ne 2 ]]; then
echo "Para ejecutar el script"
echo "se deben para la carpeta"
echo "como primer parametro"
echo "y el archivo .zip como"
echo "segundo paramentro"
exit 1
fi
Path_www=/var/www/html
Path_opt=/opt/genesys/deploy_wde
Path_zip=$Path_opt/zip
Path_log=/var/log/genesys
Path_Hist=$Path_opt/Historico
Folder_Destino=$1 # InteractionWorkspace o InteractionWorkspace_Prepro
File_zip=$Path_zip/$2
Fecha=$(date +'%Y%m%d')
dates=$(date +'%Y-%m-%d--%H:%M:%S')
UPAC=x001357
UEST=x001356
UHOR=x002492
Host=$(hostname -s)
perm=775
#backup de lo actua
log=$Path_log/Deploy-$Fecha.log
logerr=$Path_log/Deploy-error-$Fecha.log
if [ -e $Path_www/$Folder_Destino ]; then
{
    if [ -e $Path_Hist ]; then
    {
        msg_hist="Se puede realizar la copia de seguridad" 
        Valida_Bkp=1
    }
    else
    {
        msg_hist="No existe la carpeta Historico en $Path_opt"
        Valida_Bkp=0
    }
    fi
    msg_www="Este servidor tiene ClickOnce de PIC"
    Valida_InteractionWorkspace=1
}
else
{
    msg_www="Este servidor no tiene ClickOnce de PIC"
    Valida_InteractionWorkspace=0
}
fi
if [[ $Valida_Bkp==1 || $Valida_InteractionWorkspace==1 ]]; then
{
    echo -e  "$dates #############################################################################" >> $log
    echo -e  "$dates #                                                                           #" >> $log
    echo -e  "$dates #                 D  E  P  L  O  Y      W  D  E                             #" >> $log 
    echo -e  "$dates #                                                                           #" >> $log
    echo -e  "$dates #############################################################################" >> $log 
    echo -e  "$dates # Desarrollado por: Juan Emilio Maydup            (TM) $dates #" >> $log
    echo -e  "$dates #############################################################################" >> $log
    echo -e  "$dates $msg_www" >> $log
    echo -e  "$dates $msg_hist" >> $log
    echo -e  "$dates Iniciando Backup..." >> $log
    control_origen=$("ls $Path_www/$Folder_Destino | du -s")
    origen=$Path_www/$Folder_Destino
    destino=$Path_Hist/$Folder_Destino$Fecha
   mv $origen $destino 
    echo "moviendo $origen a $destino" 
    echo "$dates # moviendo desde $origen a $destino" >> $log
    control_bkp=$("ls $Path_Hist/$Folder_Destino$Fecha | du -s")
        if [ -e $Path_Hist/$Folder_Destino$Fecha ]; then
        {
            if [ "$control_origen" == "$control_origen" ]; then
            {
                echo -e  "$dates Backup realizado correctamente, control de integridad" >> $log
            }
            else
            {
                echo -e  "$dates Backup corrupto, no continuar " >> $logerr
                echo -e  "$dates #############################################################################" >> $log
                echo -e  "$dates #                                                                           #" >> $log
                echo -e  "$dates #       .-.-------.__  __ __                                _.-^-._    .--. #" >> $log
                echo -e  "$dates #      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $log
                echo -e  "$dates #    ,-o-(        (_,           )                       /     |_|   \\|   | #" >> $log
                echo -e  "$dates #   (__,-       ,-o-(            )>                    /             \\   | #" >> $log 
                echo -e  "$dates #      (       (__,-             )                    /|     _____    \\  | #" >> $log  
                echo -e  "$dates #       ---._.--._(             )                      |    |==|==|    |  | #" >> $log 
                echo -e  "$dates #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #" >> $log 
                echo -e  "$dates # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #" >> $log 
                echo -e  "$dates #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#" >> $log 
                echo -e  "$dates #############################################################################" >> $log 
                exit 1
            }
            fi       
        }
        else
        {
            echo -e  $dates "Backup no realizado ,no continuar" >> $logerr
            echo -e  "$dates #############################################################################" >> $logerr  
            echo -e  "$dates #                                                                           #" >> $logerr
            echo -e  "$dates #       .-.-------.__  __ __                                _.-^-._    .--. #" >> $logerr
            echo -e  "$dates #      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $logerr
            echo -e  "$dates #    ,-o-(        (_,           )                       /     |_|   \\|   | #" >> $logerr
            echo -e  "$dates #   (__,-       ,-o-(            )>                    /             \\   | #" >> $logerr
            echo -e  "$dates #      (       (__,-             )                    /|     _____    \\  | #" >> $logerr
            echo -e  "$dates #       ---._.--._(             )                      |    |==|==|    |  | #" >> $logerr
            echo -e  "$dates #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #" >> $logerr
            echo -e  "$dates # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #" >> $logerr
            echo -e  "$dates #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#" >> $logerr
            echo -e  "$dates #############################################################################" >> $logerr   
            exit 1
        }
        fi

            cd $Path_www
            echo -e  $dates "posicionado en $Path_www" >> $log
            echo -e  $dates "Iniciando descompresion...." >> $log
            unzip $File_zip $Path_ww
            echo -e  $dates "Finalizo la descompresion...." >> $log
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
        echo -e  $dates "$msg_site el cambio de permisos"
        chown -R $user $Path_www/$Folder_Destino
        echo -e  $dates "$msg_site el cambio de owner"
        chgrp -R $user $Path_www/$Folder_Destino
        echo -e  $dates "$msg_site el cambio de grupo"
        echo -e  "$dates #############################################################################" >> $log
        echo -e  "$dates #                                                                           #" >> $log
        echo -e  "$dates #       .-.-------.__  __ __                                _.-^-._    .--. #" >> $log
        echo -e  "$dates #      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $log
        echo -e  "$dates #    ,-o-(        (_,           )                       /     |_|   \\|   | #" >> $log
        echo -e  "$dates #   (__,-       ,-o-(            )>                    /             \\   | #" >> $log
        echo -e  "$dates #      (       (__,-             )                    /|     _____    \\  | #" >> $log
        echo -e  "$dates #       ---._.--._(             )                      |    |==|==|    |  | #" >> $log
        echo -e  "$dates #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #" >> $log
        echo -e  "$dates # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #" >> $log
        echo -e  "$dates #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#" >> $log
        echo -e  "$dates #############################################################################" >> $log
        }
    fi 
}     
else
{
    if [ $Valida_InteractionWorkspace = 0 || $Valida_Bkp = 0 ]; then
    {
        echo -e  "$dates #############################################################################" >> $logerr
        echo -e  "$dates #                                                                           #" >> $logerr
        echo -e  "$dates #                 D  E  P  L  O  Y      W  D  E                             #" >> $logerr 
        echo -e  "$dates #                                                                           #" >> $logerr
        echo -e  "$dates #############################################################################" >> $logerr
        echo -e  "$dates # Desarrollado por: Juan Emilio Maydup            (TM) $dates #" >> $logerr
        echo -e  "$dates #############################################################################" >> $logerr
        echo -e  "$dates $msg_www" >> $logerr
        echo -e  "$dates $msg_hist" >> $logerr
        echo -e  "$dates #############################################################################" >> $logerr
        echo -e  "$dates #                                                                           #" >> $logerr
        echo -e  "$dates #       .-.-------.__  __ __                                _.-^-._    .--. #" >> $logerr
        echo -e  "$dates #      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $logerr
        echo -e  "$dates #    ,-o-(        (_,           )                       /     |_|   \\|   | #" >> $logerr
        echo -e  "$dates #   (__,-       ,-o-(            )>                    /             \\   | #" >> $logerr
        echo -e  "$dates #      (       (__,-             )                    /|     _____    \\  | #" >> $logerr
        echo -e  "$dates #       ---._.--._(             )                      |    |==|==|    |  | #" >> $logerr
        echo -e  "$dates #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #" >> $logerr
        echo -e  "$dates # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #" >> $logerr
        echo -e  "$dates #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#"  >> $logerr
        echo -e  "$dates #############################################################################"  >> $logerr
        exit 1
    }
    else
    {
        echo -e  "$dates #############################################################################" >> $logerr
        echo -e  "$dates #                                                                           #" >> $logerr
        echo -e  "$dates #                 D  E  P  L  O  Y      W  D  E                             #" >> $logerr
        echo -e  "$dates #                                                                           #" >> $logerr
        echo -e  "$dates #############################################################################" >> $logerr
        echo -e  "$dates # Desarrollado por: Juan Emilio Maydup            (TM) $dates #" >> $logerr
        echo -e  "$dates #############################################################################" >> $logerr
        echo -e  "$dates # valida que paso                                                           #" >> $logerr
        echo -e  "$dates #############################################################################" >> $logerr
        echo -e  "$dates #                                                                           #" >> $logerr
        echo -e  "$dates #       .-.-------.__  __ __                                _.-^-._    .--. #" >> $logerr
        echo -e  "$dates #      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $logerr
        echo -e  "$dates #    ,-o-(        (_,           )                       /     |_|   \\|   | #" >> $logerr
        echo -e  "$dates #   (__,-       ,-o-(            )>                    /             \\   | #" >> $logerr
        echo -e  "$dates #      (       (__,-             )                    /|     _____    \\  | #" >> $logerr
        echo -e  "$dates #       ---._.--._(             )                      |    |==|==|    |  | #" >> $logerr
        echo -e  "$dates #          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #" >> $logerr
        echo -e  "$dates # ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #" >> $logerr
        echo -e  "$dates #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#" >> $logerr
        echo -e  "$dates #############################################################################" >> $logerr
        exit 1  
    }  
    fi
}
fi