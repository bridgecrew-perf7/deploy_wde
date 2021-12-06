#!/bin/bash
dates=$(date +'%Y-%m-%d--%H%M%S')
log=./log/log-$(date +'%Y-%m-%d--%H%M%S').log 
errlog=./log/errlog-$(date +'%Y-%m-%d--%H%M%S').log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $log 
echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#                 D  E  P  L  O  Y      W  D  E                             #"  >> $log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $log
echo -e $(date +'%Y-%m-%d--%H%M%S') "# Desarrollado por: Juan Emilio Maydup            (TM) $dates #" >> $log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $log

if [[ $# -eq 0 ]] ; then
{
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $errlog  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#                 D  E  P  L  O  Y      W  D  E                             #"  >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $errlog 
    echo -e $(date +'%Y-%m-%d--%H%M%S') "# Desarrollado por: Juan Emilio Maydup            (TM) $dates #" >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#     debe ingresar el nombre del archivo                                     #" >> $errlog 
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#       .-.-------.__  __ __                                _.-^-._    .--. #"  >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#    ,-o-(        (_,           )                       /     |_|   \\|    | #" >> $errlog  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#   (__,-       ,-o-(            )>                    /             \\    | #"  >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (       (__,-             )                    /|     _____    \\   | #"  >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#       ---._.--._(             )                      |    |==|==|    |  | #"  >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #"  >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "# ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #"  >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#"  >> $errlog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $errlog
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
            /usr/bin/sudo /usr/local/seguridad/bin/fttput $host $file /var/www/html/$file
            END=$(date +%s) 
            vtime=$((END-START))
            echo -e $(date +'%Y-%m-%d--%H%M%S') "# Copiado al $host en duracion: $(($vtime / 3600 )) horas $((($vtime % 3600) / 60)) minutos $(($vtime % 60)) segundos #" >> $log
        done 
        GEND=$(date +%s)
        Gvtime=$((GEND-GSTART)) 
        echo -e $(date +'%Y-%m-%d--%H%M%S') "# Copiado a todos los host, Duracion Total: $(($Gvtime / 3600 )) horas $((($Gvtime % 3600) / 60)) minutos $(($Gvtime % 60)) segundos #" >> $log
    }
    else
    {
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $errlog  
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#                 D  E  P  L  O  Y      W  D  E                             #"  >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $errlog 
        echo -e $(date +'%Y-%m-%d--%H%M%S') "# Desarrollado por: Juan Emilio Maydup            (TM) $dates #" >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $errlog
        echo -e  $(date +'%Y-%m-%d--%H%M%S') "# el archivo no existe.                                                    #" >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#       .-.-------.__  __ __                                _.-^-._    .--. #"  >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#    ,-o-(        (_,           )                       /     |_|   \\|    | #" >> $errlog  
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#   (__,-       ,-o-(            )>                    /             \\    | #"  >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (       (__,-             )                    /|     _____    \\   | #"  >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#       ---._.--._(             )                      |    |==|==|    |  | #"  >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #"  >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "# ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #"  >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#"  >> $errlog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $errlog
        exit 2
    }
    fi
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#       .-.-------.__  __ __                                _.-^-._    .--. #"  >> $log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#    ,-o-(        (_,           )                       /     |_|   \\|    | #" >> $log  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#   (__,-       ,-o-(            )>                    /             \\    | #"  >> $log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (       (__,-             )                    /|     _____    \\   | #"  >> $log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#       ---._.--._(             )                      |    |==|==|    |  | #"  >> $log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #"  >> $log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "# ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #"  >> $log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#"  >> $log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $log
}
fi