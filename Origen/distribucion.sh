#!/bin/bash
log=./log/log-$(date +'%Y-%m-%d--%H%M%S').log 
errlog=./log/errlog-$(date +'%Y-%m-%d--%H%M%S').log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" 
echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" 
echo -e $(date +'%Y-%m-%d--%H%M%S') "#                 D  E  P  L  O  Y      W  D  E                             #"  
echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" 
echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  
echo -e $(date +'%Y-%m-%d--%H%M%S') "# Desarrollado por: Juan Emilio Maydup            (TM) $dates #" 
echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"
if [[ $# -eq 0 ]] ; then
{
    echo $(date +'%Y-%m-%d--%H%M%S') 'debe ingresar el nombre del archivo' >> $errlog
    exit 1
}
else 
{
    file=$1
    if [ -f "$file" ]; then
    {
        GSTART=$(date +%s);
        lista=plpicpacapp13,plpicpacapp14,plpicpacapp15,plpicpacapp16,plpicpacapp17,plpicpacapp18,plpicpacapp19,plpicpacapp20,plpicpacapp21,plpicpacapp22,plpicpacapp23,plpicpacapp24,plpicpacapp25,plpicpacapp26,plpicpacapp27,plpicpacapp28,plpicpacapp29,plpicpacapp30,plpicestapp13,plpicestapp14,plpicestapp15,plpicestapp16,plpicestapp17,plpicestapp18,plpicestapp19,plpicestapp20,plpicestapp21,plpicestapp22,plpicestapp23,plpicestapp24,plpicestapp25,plpicestapp26,plpicestapp27,plpicestapp28,plpicestapp29,plpicestapp30
        for host in ${lista//,/ }
        do
            START=$(date +%s) 
            #/usr/bin/sudo /usr/local/seguridad/bin/fttput $host $file /var/www/html/$file
            END=$(date +%s) 
            vtime=$((END-START)) | awk '{print int($1/60)":"int($1%60)}'
            echo $(date +'%Y-%m-%d--%H%M%S') "Copiado en $host con una duracion de $vtime minutos" >> $log
        done 
        GEND=$(date +%s);
        Gvtime=$((END-START)) | awk '{print int($1/60)":"int($1%60)}'
        echo $(date +'%Y-%m-%d--%H%M%S') "Duracion total de copiado $Gvtime minutos" >> $log 
    }
    else
    {
        echo $(date +'%Y-%m-%d--%H%M%S') "el archivo no existe" >> $errlog
        exit 2
    }
    fi
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" 
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" 
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#       .-.-------.__  __ __                                _.-^-._    .--. #"  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (_,         .-:-  -  --._                         .--   _   --. |__| #"  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#    ,-o-(        (_,           )                       /     |_|   \\|    | #"  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#   (__,-       ,-o-(            )>                    /             \\    | #"  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (       (__,-             )                    /|     _____    \\   | #"  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#       ---._.--._(             )                      |    |==|==|    |  | #"  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #"  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "# ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #"  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#"  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  
}
fi
