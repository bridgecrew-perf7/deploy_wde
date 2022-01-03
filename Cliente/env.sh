export path_opt=/opt/genesys/deploy_wde
export path_zip=$path_opt/zip
export path_log=$path_opt/log
export path_hist=$path_opt/historico

Host=$(hostname -s)
function enviroment()
{
case "${1}" in
    InteractionWorkspace)
    export path_www=/var/www/html/InteractionWorkspace
    echo -e $(date +'%Y-%m-%d--%H:%M:%S') "Produccion"
    ;;
    InteractionWorkspace_PreProd)
    export path_www=/var/www/html/InteractionWorkspace_PreProd
    echo -e $(date +'%Y-%m-%d--%H:%M:%S') "Pre - Produccion"
    ;;
    *)
    echo -e $(date +'%Y-%m-%d--%H:%M:%S') "Validar Primer Parametro"
    ;;
esac
}

#
function site()
{
case $Host in
    *pac*)
        export user=x001357
        export perm=775
        export msg_site='Implementado en pacheco'
        ;;
    *est*)
        export user=x001356
        export perm=775
        export msg_site='Implementado en estomba'
        ;;
    *gir*)
        export user=x002492
        export perm=775
        export msg_site='Implementado en hornos'
        ;;
    *)  
    export user=root
    export perm=775
    export msg_site='Implementado en Dios Sabe donde'    
        ;;
esac
}
#
function Validate_folder()
{
    #validamos la exisitencia de lascarpetas 
    #log
    #historico
    #zip

}

function header()
{
echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $Log 
echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $Log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#                 D  E  P  L  O  Y      W  D  E                             #"  >> $Log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#                                                                           #" >> $Log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################"  >> $Log
echo -e $(date +'%Y-%m-%d--%H%M%S') "# Desarrollado por: Juan Emilio Maydup            (TM) $Dates #" >> $Log
echo -e $(date +'%Y-%m-%d--%H%M%S') "#############################################################################" >> $Log
}

function footer()
{
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
        
}   