#!/bin/bash
Dates=$(date +'%Y-%m-%d--%H%M%S')
Log=./log/log-$(date +'%Y-%m-%d--%H%M%S').log 
ErrLog=./log/ErrLog-$(date +'%Y-%m-%d--%H%M%S').log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $Log 
echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $Log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#                 D  E  P  L  O  Y      W  D  E                             #"  >> $Log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $Log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $Log
echo -e $(date +'%Y-%m-%d--%H%M%S') "# Desarrollado por: Juan Emilio Maydup            (TM) $Dates #" >> $Log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $Log

if [[ $# -eq 0 ]] ; then
{
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $ErrLog  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#                 D  E  P  L  O  Y      W  D  E                             #"  >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $ErrLog 
    echo -e $(date +'%Y-%m-%d--%H%M%S') "# Desarrollado por: Juan Emilio Maydup            (TM) $Dates #" >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#     debe ingresar el nombre del archivo                                     #" >> $ErrLog 
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#       .-.-------.__  __ __                                _.-^-._    .--. #"  >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#    ,-o-(        (_,           )                       /     |_|   \\|    | #" >> $ErrLog  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#   (__,-       ,-o-(            )>                    /             \\    | #"  >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (       (__,-             )                    /|     _____    \\   | #"  >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#       ---._.--._(             )                      |    |==|==|    |  | #"  >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #"  >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "# ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #"  >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#"  >> $ErrLog
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $ErrLog
    exit 1
}
else 
{
    if [ -f $1 ]; then
    {              
	case $2 in
		pacheco | Pac | PAC | pac | Pacheco | PACHECO)
		Lista=plpicpacapp13,plpicpacapp14,plpicpacapp15,plpicpacapp16,plpicpacapp17,plpicpacapp18,plpicpacapp19,plpicpacapp20,plpicpacapp21,plpicpacapp22,plpicpacapp23,plpicpacapp24,plpicpacapp25,plpicpacapp26,plpicpacapp27,plpicpacapp28,plpicpacapp29,plpicpacapp30
		echo "Pacheco"
        ;;
		estomba | Est | EST | est | Estomba | ESTOMBA)
		Lista=plpicestapp13,plpicestapp14,plpicestapp15,plpicestapp16,plpicestapp17,plpicestapp18,plpicestapp19,plpicestapp20,plpicestapp21,plpicestapp22,plpicestapp23,plpicestapp24,plpicestapp25,plpicestapp26,plpicestapp27,plpicestapp28,plpicestapp29,plpicestapp30
        echo "Estomba"
        ;;
		*)
		echo -e $(date +'%Y-%m-%d--%H%M%S') "#     debe ingresar el nombre de un site                                      #" >> $ErrLog
		;;
	esac
        Gstart=$(date +%s);
        for host in ${Lista//,/ }
        do
            start=$(date +%s) 
            /usr/bin/sudo /usr/local/seguridad/bin/fttput $host $file /var/www/html/$file
            end=$(date +%s) 
            Vtime=$((end-start))
            echo -e $(date +'%Y-%m-%d--%H%M%S') "# Copiado al $host en duracion: $(($Vtime / 3600 )) horas $((($Vtime % 3600) / 60)) minutos $(($Vtime % 60)) segundos #" >> $Log
        done 
        Gend=$(date +%s)
        GVtime=$((Gend-Gstart)) 
        echo -e $(date +'%Y-%m-%d--%H%M%S') "# Copiado a todos los host, Duracion Total: $(($GVtime / 3600 )) horas $((($GVtime % 3600) / 60)) minutos $(($GVtime % 60)) segundos #" >> $Log
    }
    else
    {
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $ErrLog  
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#                 D  E  P  L  O  Y      W  D  E                             #"  >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $ErrLog 
        echo -e $(date +'%Y-%m-%d--%H%M%S') "# Desarrollado por: Juan Emilio Maydup            (TM) $Dates #" >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "# el archivo no existe.                                                    #" >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#       .-.-------.__  __ __                                _.-^-._    .--. #"  >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#    ,-o-(        (_,           )                       /     |_|   \\|    | #" >> $ErrLog  
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#   (__,-       ,-o-(            )>                    /             \\    | #"  >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (       (__,-             )                    /|     _____    \\   | #"  >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#       ---._.--._(             )                      |    |==|==|    |  | #"  >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #"  >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "# ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #"  >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#"  >> $ErrLog
        echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $ErrLog
        exit 2
    }
    fi
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $Log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $Log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#       .-.-------.__  __ __                                _.-^-._    .--. #" >> $Log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (_,         .-:-  -  --._                         .--   _   --. |__| #" >> $Log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#    ,-o-(        (_,           )                       /     |_|   \\|    | #" >> $Log  
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#   (__,-       ,-o-(            )>                    /             \\    | #"  >> $Log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#      (       (__,-             )                    /|     _____    \\   | #"  >> $Log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#       ---._.--._(             )                      |    |==|==|    |  | #"  >> $Log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#          |||  |||---._.--._.--        |--|--|--|--|--|    |--|--|    |  | #"  >> $Log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "# ^^^^^^^^^^          |||  |||          |--|--|--|--|--|    |==|==|    |  | #"  >> $Log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#"  >> $Log
    echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $Log
}
fi

