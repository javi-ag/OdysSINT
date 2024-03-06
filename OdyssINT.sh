#!/bin/bash

###### COLORES ######
green="\e[0;32m\033[1m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[1;35m\033[1m"
cyan="\e[0;36m\033[1m"
white="\e[0;37m\033[1m"
black="\e[0;30m\033[1m"

# Bold High Intensity
bgreen='\033[1;92m'
bred='\033[1;91m'
bblue='\033[1;94m'
byellow='\033[1;93m'
bpurple='\033[1;95m'
bcyan='\033[1;96m'
bwhite='\033[1;97m'
bblack='\033[1;90m'

# Subrayados
ugreen='\033[4;32m'
ured='\033[4;31m'
ublue='\033[4;34m'
uyellow='\033[4;33m'
upurple='\033[4;35m'
ucyan='\033[4;36m'
uwhite='\033[4;37m'
ublack='\033[4;30m'

# High Intensity
igreen='\033[0;92m'
ired='\033[0;91m'
iblue='\033[0;94m'
iyellow='\033[0;93m'
ipurple='\033[0;95m'
icyan='\033[0;96m'
iwhite='\033[0;97m'
iblack='\033[0;90m'

# Background
Bgreen='\033[42m'
Bred='\033[41m'
Bblue='\033[44m'
Byellow='\033[43m'
Bpurple='\033[45m'
Bcyan='\033[46m'
Bwhite='\033[47m'
Bblack='\033[40m'

# High Intensity backgrounds
ogreen='\033[0;102m'
ored='\033[0;101m'
oblue='\033[0;104m'
oyellow='\033[0;103m'
opurple='\033[0;105m'
ocyan='\033[0;106m'
owhite='\033[0;107m'
oblack='\033[0;100m'

#Especiales
end="\033[0m\e[0m"
warning="\e[5;31m\033[1m"

###### VARIABLES ######

# Requerimientos OdysSINT
declare requerimientos=("git" "python3-full" "python3-pip" "python3-virtualenv" "gnome-terminal" "nodejs" "firefox-esr" "openjdk-17-jdk" "curl" "wget" "alien")
# Lista de aplicaciones OSINT
declare aplicacionesOSINT=("theHarvester" "recon-ng" "Spiderfoot" "Maltego" "Zotero" "Nexfil" "ArchiveBox" "Photon")
# Lista de aplicaciones complementarias
declare aplicacionesComplementarias=("KeePassxc" "Onionshare" "Emacs" "Zenmap" "7zip" "vlc")

# URL repositorio Github
declare odyssint_github_url="https://raw.githubusercontent.com/javi-ag/OdysSINT/main/OdysSINT"
# Versión de script
declare script_version=1.0
#Directorio de trabajo de OdysSINT
declare odyssinthome=$HOME/odyssint
#Nombre fichero script
declare nombre_script=$(basename "$0")
# Nombre del archivo de log
#declare logfile="$odyssinthome/logs/$(date +'%Y-%m-%d-%H-%M')-OdysSINT.log"
declare logfile="$odyssinthome/logs/$(date +'%Y-%m-%d')-OdysSINT.log"

###### FUNCIONES ######

#Función para mostrar el banner inicial.
function mostrar_banner() {
	# Limpia la pantalla
	clear
	echo -e ${bred}"                                                                                      "
	echo -e "           ███████        █████                     █████████  █████ ██████   █████ ███████████   "
	echo -e "         ███░░░░░███     ░░███                     ███░░░░░███░░███ ░░██████ ░░███ ░█░░░███░░░█   "
	echo -e "        ███     ░░███  ███████  █████ ████  █████ ░███    ░░░  ░███  ░███░███ ░███ ░   ░███  ░    "
	echo -e "       ░███      ░███ ███░░███ ░░███ ░███  ███░░  ░░█████████  ░███  ░███░░███░███     ░███       "
	echo -e "       ░███      ░███░███ ░███  ░███ ░███ ░░█████  ░░░░░░░░███ ░███  ░███ ░░██████     ░███       "
	echo -e "       ░░███     ███ ░███ ░███  ░███ ░███  ░░░░███ ███    ░███ ░███  ░███  ░░█████     ░███       "
	echo -e "        ░░░███████░  ░░████████ ░░███████  ██████ ░░█████████  █████ █████  ░░█████    █████      "
	echo -e "          ░░░░░░░     ░░░░░░░░   ░░░░░███ ░░░░░░   ░░░░░░░░░  ░░░░░ ░░░░░    ░░░░░    ░░░░░       "
	echo -e "                                 ███ ░███                                                         "
	echo -e "                                ░░██████                                                          "
	echo -e "                                 ░░░░░░                                                           "
	echo -e
	echo -e "  \t\t\t    Script de instalación y uso de herramientas OSINT"${end}
	echo -e "  \t\t"
	echo -e "  \t\t\t\t  ${bgreen}Master Ciberseguridad 12ª Edición "${end}
	echo -e "  \t\t\t\t  Autor: ${bblue}Javier Aguilar"${end}
	echo -e "  \t\t\t\t  Tutor: ${cyan}Juanjo Salvador"${end}
	echo -e "  \t\t\t\t  Correo: ${byellow}odyssint@protonmail.com"${end}
	# Muestra la versión actual del script y si hay actualizaciones o errores.
	echo -e "  \t\t\t\t  Versión ${blue}$script_version${end}${warning} $script_version_update"${end}
	echo -e "  \t\t\t\t  Última modificación: ${blue}15-03-2024"${end}
	echo -e
	#echo -e "Colores:"
	#echo -e "Normal ${green}green,${red}red,${blue}blue,${yellow}yellow,${purple}purple,${cyan}cyan,${white}white,${black}black"${end}
	#echo -e "bcolor ${bgreen}green,${bred}red,${bblue}blue,${byellow}yellow,${bpurple}purple,${bcyan}cyan,${bwhite}white,${bblack}black"${end}
	#echo -e "ucolor ${ugreen}green,${ured}red,${ublue}blue,${uyellow}yellow,${upurple}purple,${ucyan}cyan,${uwhite}white,${ublack}black"${end}
	#echo -e "icolor ${igreen}green,${ired}red,${iblue}blue,${iyellow}yellow,${ipurple}purple,${icyan}cyan,${iwhite}white,${iblack}black"${end}
	#echo -e "Bcolor ${Bgreen}green,${Bred}red,${Bblue}blue,${Byellow}yellow,${Bpurple}purple,${Bcyan}cyan,${Bwhite}white,${Bblack}black"${end}
	#echo -e "ocolor ${ogreen}green,${ored}red,${oblue}blue,${oyellow}yellow,${opurple}purple,${ocyan}cyan,${owhite}white,${oblack}black"${end}
	#echo -e "Especiales: ${warning}alerta"${end}
}

###### IDEAS #######

function helpPanel() {
	echo -e "${cyan}\n[?] Uso: ./ns21Osint.sh${end}"
	echo -e "\n\t${purple}${end}${yellow} Modo${end}"
	echo -e "\t\t${red}-a${end} -> Actualizar el sistema e instala requerimientos."
	echo -e "\t\t${red}-i${end} -> Para instalar las herramientas OSINT"
	echo -e "\t\t${red}-e${end} -> Para instalar las extensiones Firefox"
	echo -e "\t\t${red}-m${end} -> Para instalar los marcadores Firefox"
	echo -e "\t\t${red}-u${end} -> Para actualizar el script"
	echo -e "\t\t${red}-h${end} -> Mostrar este panel de ayuda"
	echo -e "\n\t${purple}${end}${yellow} Ejemplo de uso:${end}"
	echo -e "\n\t${purple}./ns21Osint.sh -i ${end}"
	echo -e "\n\t\t${yellow} Instala las herramientas OSINT${end}\n"
	exit 0
}

# PERSONALIZAR
# Eliminar juegos gnome
## apt purge --autoremove gnome-games
## sudo apt purge iagno lightsoff four-in-a-row gnome-robots pegsolitaire gnome-2048 hitori gnome-klotski gnome-mines gnome-mahjongg gnome-sudoku quadrapassel swell-foop gnome-tetravex gnome-taquin aisleriot gnome-chess five-or-more gnome-nibbles tali ; sudo apt autoremove

###### IDEAS #######

# Función para mostrar el menú principal
function mostrar_menu_principal() {

	echo -e ${bpurple}"------------------------------------------------------------------------------------------------------"${end}${opurple}
	echo -e ${bwhite}"                                        MENÚ PRINCIPAL                                                "${end} | tee -a >(log) 2>&1
	echo -e ${bpurple}"------------------------------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${bblue}" 1. Herramientas OSINT"${end}
	echo -e ${bpurple}" 2. Marcadores y extensiones Firefox"${end}
	echo -e ${bcyan}" 3. Herramientas complementarias"${end}
	echo -e ${bgreen}" 4. Configurar OdysSINT"${end}
	echo -e
	echo -e ${byellow}" s. Salir del script"${end}
	echo -e ${bpurple}"------------------------------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${bblack}" Selecciona una opción: "${end})" -n 1 -r menu_principal
	echo -e
	case $menu_principal in
	1) #Herramientas OSINT
		mostrar_banner
		listar_herramientas_osint
		;;
		
	2) #Marcadores y extensiones en Firefox
		# Verificar si Firefox está instalado
		if [ ! -d "$HOME/.mozilla/firefox/firefoxprofile.ulysses" ]; then
		instalar "Perfil_Firefox"
		fi
		# Deshabilitar las advertencias de GTK
		export GTK_MODULES=
		# Lanzar Firefox con perfil Ulysses en una nueva ventana
		echo -e ${bpurple}"Iniciando Firefox..."${end} | tee -a >(log) 2>&1
		gnome-terminal -- $SHELL -c "
		echo '----------------------------'
		echo '---- OdysSINT - Firefox ----'
		echo '----------------------------'
		echo '|  NO CERRAR ESTA VENTANA. |'
		echo '|  ACTUALIZAR MARCADORES   |'
		echo '|  CON EXTENSIÓN:          |'
		echo '|  BookmarkHub             |'
		echo '----------------------------' &&
		firefox -P Ulysses; exec $SHELL"
		echo -e ${bgreen}"Firefox iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		mostrar_menu_principal
		;;
		
	3) #Herramientas complementarias
		mostrar_banner
		listar_herramientas_complementarias
		;;
		
	4) #Configurar OdysSINT
		mostrar_banner
		listar_configurar_odyssint
		;;
		
	s)
		salir_del_script
		mostrar_banner
		mostrar_menu_principal
		;;
		
	S)
		salir_del_script
		mostrar_banner
		mostrar_menu_principal
		;;
		
	*)
		echo -e "${bred}Opción inválida"${end}
		continuar
		mostrar_menu_principal
		;;
	esac

}

# Función para mostrar el menú de herramientas OSINT
function listar_herramientas_osint() {

	echo -e ${bblue}"------------------------------------------------------------------------------------------------------"${end}${oblue}
	echo -e ${bwhite}"                                         HERRAMIENTAS OSINT                                           "${end} | tee -a >(log) 2>&1
	echo -e ${bblue}"------------------------------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${bblue}"  RECOLECCIÓN DE INFORMACIÓN Y RECONOCIMIENTO"${end}
	echo -e ${bblue}" 1. The Harvester:${blue} obtiene emails, IPs y subdominios de diferentes fuentes online.(CLI)"${end}
	echo -e ${bblue}" 2. Recon-ng:${blue} framework de automatización para tareas OSINT que ejecuta diferentes módulos"${end}
	echo -e ${blue} "    para recopilar información de forma eficiente (CLI/Web)."${end}
	echo -e ${bblue}" 3. Spiderfoot:${blue} herramienta que automatiza la recolección de información sobre activos"${end}
	echo -e ${blue} "    en línea desde multiples fuentes, identificando riesgos de seguridad e inteligencia (Web)."${end}
	echo -e ${bblue}" 4. Maltego:${blue} extrae y analiza datos de múltiples fuentes mediante transformadas representándolos"${end}
	echo -e ${blue} "    de forma visual y permitiendo encontrar relaciones y patrones (App)."${end}
	echo -e ${bblue}" 5. Nexfil:${blue}encuentra nombres de usuarios en más de 350 webs en pocos segundos (CLI)."${end}
	echo -e ${bblue}" 6. Photon:${blue} rastrea rápidamente webs y recopilar información como URLs, archivos y metadatos (CLI)."${end}	
	echo -e
	echo -e ${bcyan}"  OTROS"${end}
	echo -e ${bcyan}" 7. ArchiveBox:${cyan} archivado local de páginas webs para su visualización offline."${end}
	echo -e ${cyan} "    Instalar extensión de Firefox desde configuación de OdysSINT (Web/Add-on)."${end}
	echo -e ${bcyan}" 8. Zotero:${cyan} gestor de referencias para investigaciones que permite organizar y compartir citas"${end}
	echo -e ${cyan} "    Instalar extensión de Firefox desde configuación de OdysSINT (App/Add-on)."${end}
		
	echo -e ${bcyan}" X. osint-suite-tools???"${end}
	echo -e
	echo -e ${byellow}" 0. Volver a menú principal"${end}
	echo -e ${byellow}" s. Salir del script"${end}
	echo -e ${bblue}"------------------------------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${bblack}" Selecciona una opción: "${end})" -n 1 -r herramientas_osint
	echo -e
	case "$herramientas_osint" in

	1) #theHarvester: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta isntalación.	
		if [ ! -f "$odyssinthome/theharvester/theHarvester.py" ]; then 
			instalar "theHarvester"
		fi
		#Compruebo donde se ha instalado la activación del entorno virtual e inicializo aplicación .Compatibilidad con Debian
		comprobar_virtualenv "theHarvester"
		# Lanzo la herramienta en una nueva ventana y muestro ayuda para lanzar de nuevo
		gnome-terminal -- $SHELL -c "source activate &&
		cd $odyssinthome/theharvester/ && $odyssinthome/theharvester/theHarvester.py &&
		echo
		echo
		echo '-----------------------------------'
		echo '----- OdysSINT - theHarvester -----'
		echo '-----------------------------------'
		echo '|  MODO CLI: ./theHarvester.py    |'
		echo '|  AYUDA:    ./theHarvester.py -h |'
		echo '-----------------------------------'; exec $SHELL"
		echo -e ${bgreen}"theHarvester iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_osint
		;;

	2) #Recon-ng: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta isntalación.
		if [ ! -f "$odyssinthome/recon-ng/recon-ng" ]; then
			instalar "Recon-ng"
		fi
		#Compruebo donde se ha instalado la activación del entorno virtual e inicializo aplicación
		comprobar_virtualenv "Recon-ng"
		# Lanzo la herramienta en una nueva ventana y muestro ayuda para lanzar de nuevo
		echo "$venv_path"
		gnome-terminal -- $SHELL -c "source activate &&
		cd $odyssinthome/recon-ng/ && $odyssinthome/recon-ng/recon-ng -h &&
		echo 
		echo
		echo '------------------------------'
		echo '----- OdysSINT - Recon-ng ----'
		echo '------------------------------'
		echo '|  MODO CLI: ./recon-ng      |'
		echo '|  AYUDA:    ./recon-ng -h   |'
		echo '|  MODO WEB: ./recon-web     |'
		echo '|  AYUDA:    ./recon-web -h  |'
		echo '------------------------------'; exec $SHELL"
		echo -e ${bgreen}"Recon-ng iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_osint
		;;

	3) #Spiderfoot: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta isntalación.
		if [ ! -f "$odyssinthome/spiderfoot/sfcli.py" ]; then
			instalar "Spiderfoot"
		fi
		#Compruebo donde se ha instalado la activación del entorno virtual e inicializo aplicación
		comprobar_virtualenv "Spiderfoot"
		# Lanzo la herramienta en una nueva ventana
		gnome-terminal -- $SHELL -c "source activate &&
		python3 $odyssinthome/spiderfoot/sf.py -l 127.0.0.1:5001; exec $SHELL"
		echo -e ${bgreen}"Spiderfoot iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_osint
		;;
	4) #Maltego: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta isntalación.
		if ! command -v maltego &>/dev/null; then
			instalar "Maltego"
		fi
		# Lanzo la herramienta en una nueva ventana
		gnome-terminal -- $SHELL -c "maltego; exec $SHELL"
		echo -e ${bgreen}"Maltego iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_osint
		;;
	5) #Nexfil: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta isntalación.
		if [ ! -d "$odyssinthome/nexfil" ]; then
			instalar "Nexfil"
		fi
		#Compruebo donde se ha instalado la activación del entorno virtual e inicializo aplicación
		comprobar_virtualenv "Nexfil"
		# Lanzo la herramienta en una nueva ventana y muestro ayuda para lanzar de nuevo
		gnome-terminal -- /bin/bash -c "source activate &&
		nexfil -h &&
		echo 
		echo
		echo '-------------------------'
		echo '--- OdysSINT - Nexfil ---'
		echo '-------------------------'
		echo '|  MODO CLI: nexfil     |'
		echo '|  AYUDA:    nexfil -h  |'
		echo '-------------------------'; exec $SHELL"
		echo -e ${bgreen}"Nexfil iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		mostrar_banner
		listar_herramientas_osint
		;;
	6) #Photon: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta isntalación.
		if [ ! -f "$odyssinthome/photon/photon.py" ]; then
			instalar "Photon"
		fi
		#Compruebo donde se ha instalado la activación del entorno virtual e inicializo aplicación
		comprobar_virtualenv "Photon"
		# Lanzo la herramienta en una nueva ventana y muestro ayuda para lanzar de nuevo
		gnome-terminal -- $SHELL -c "source activate &&
		cd $odyssinthome/photon/ && python3 $odyssinthome/photon/photon.py &&
		echo 
		echo
		echo '-----------------------------------'
		echo '-------  OdysSINT - Photon  -------'
		echo '-----------------------------------'
		echo '|  MODO CLI: python3 photon.py    |' 
		echo '|  AYUDA:    python3 photon.py -h |'
		echo ------------------------------------; exec $SHELL" 
		echo -e ${bgreen}"Photon iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_osint
		;;
	7) #ArchiveBox: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta isntalación.
		if [ ! -d "$odyssinthome/archivebox/data/" ]; then
			instalar "ArchiveBox"
		fi
		#Compruebo donde se ha instalado la activación del entorno virtual e inicializo aplicación
		comprobar_virtualenv "ArchiveBox"
		# Lanzo la herramienta en una nueva ventana
		gnome-terminal -- $SHELL -c "source activate &&
		cd $odyssinthome/archivebox/data && archivebox server 127.0.0.1:8000; exec /bin/bash"
		echo -e ${bgreen}"ArchiveBox iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_osint
		;;
	8) #Zotero: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta isntalación.
		if ! command -v "$odyssinthome/zotero/zotero" &>/dev/null; then
			instalar "Zotero"
		fi
		# Lanzo la herramienta en una nueva ventana
		gnome-terminal -- $SHELL -c "$odyssinthome/zotero/zotero; exec $SHELL"
		echo -e ${bgreen}"Zotero iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		mostrar_banner
		listar_herramientas_osint
		;;
	0)
		mostrar_banner
		mostrar_menu_principal
		;;
	s)
		salir_del_script
		mostrar_banner
		listar_herramientas_osint
		;;
	S)
		salir_del_script
		mostrar_banner
		listar_herramientas_osint
		;;
	*)
		echo -e "${bred}Opción inválida"${end}
		continuar
		listar_herramientas_osint
		;;
	esac

}

# Función para mostrar el menú de herramientas Complementarias
function listar_herramientas_complementarias() {

	echo -e ${bcyan}  "------------------------------------------------------------------------------------------------------"${end}${ocyan}
	echo -e ${bwhite} "                                         HERRAMIENTAS COMPLEMENTARIAS                                 "${end} | tee -a >(log) 2>&1
	echo -e ${bcyan}  "------------------------------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${bcyan}  " RECOLECCIÓN DE INFORMACIÓN Y RECONOCIMIENTO"${end}
	echo -e ${bcyan}  "1. Zenamp"
	echo -e ${bcyan}  "    Descripción"${end}
	echo -e ${bcyan}  "2. Tor Browser"
	echo -e ${bcyan}  "    Descripción"${end}
	echo -e
	echo -e ${byellow}" 0. Volver a menú principal"${end}
	echo -e ${byellow}" s. Salir del script"${end}
	echo -e ${bblue}  "------------------------------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${bblack}" Selecciona una opción: "${end})" -n 1 -r herramientas_complementarias
	echo -e
	case "$herramientas_complementarias" in

	1) # Zenmap
		# Instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta isntalación.
		if ! command -v zenmap &>/dev/null; then
			instalar "Zenmap"
		fi
		#Lanzo en una nueva ventana.
		gnome-terminal -- $SHELL -c "zenmap; exec $SHELL"
		echo -e ${bgreen}"Zenmap iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_complementarias
		;;
	2) # Tor Browser
		# Instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta isntalación.
		if [ ! -f "$odyssinthome/tor-browser/start-tor-browser.desktop" ]; then
			instalar "tor"
		fi
		#Lanzo en una nueva ventana.
		gnome-terminal -- $SHELL -c "cd $odyssinthome/tor-browser/ && ./start-tor-browser.desktop; exec $SHELL"
		echo -e ${bgreen}"Tor Browser iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_complementarias
		;;
	0)
		mostrar_banner
		mostrar_menu_principal
		;;
	s)
		salir_del_script
		;;
	S)
		salir_del_script
		;;
	*)
		echo -e "${bred}Opción inválida"${end}
		continuar
		listar_herramientas_complementarias
		;;
	esac

}

# Función para mostrar el menú de configuración de OdysSINT
function listar_configurar_odyssint() {
	echo -e ${bgreen} "------------------------------------------------------------------------------------------------------"${end}${ogreen}
	echo -e ${bwhite} "                                      CONFIGURACIÓN OdysSINT                                          "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen} "------------------------------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${green}  "1. Actualizar sistema, instalar requerimientos y todas las herramientas OSINT de OdysSINT"${end}
	echo -e ${bgreen} "2. Configurar Firefox, e instalar extensiones y marcadores de OdysSINT"${end}
	echo -e ${green}  "3. Instalar o actualizar todas las herramientas complementarias"${end}
	echo -e ${bgreen} "4. Actualizar script desde GitHub y volver a ejecutar"${end}
	echo -e ${green}  "5. Abrir logs OdysSINT" ${end}
	echo -e ${bred}   "6. Desinstalar todo y limpiar instalación de OdysSINT" ${end}
	echo -e
	echo -e ${byellow}" 0. Volver a menú principal"${end}
	echo -e ${byellow}" s. Salir del script"${end}
	echo -e ${bgreen} "------------------------------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${bblack}" Selecciona una opción: "${end})" -n 1 -r configurar_odyssint

	case "$configurar_odyssint" in

	1)
		mostrar_banner
		verificar_conexion_internet
		actualizar_sistema_y_requerimientos
		;;
	2)
		mostrar_banner
		verificar_conexion_internet
		configurar_firefox
		;;
	3)
		mostrar_banner
		verificar_conexion_internet
		instalar_herramientas_complementarias
		;;
	4)
		mostrar_banner
		verificar_conexion_internet
		actualizar_y_ejecutar_script
		;;
	5)
		mostrar_banner
		abrir_log
		listar_configurar_odyssint
		;;
	6)
		mostrar_banner
		desinstalar_odyssint
		;;
	0)
		mostrar_banner
		mostrar_menu_principal
		;;
	s)
		salir_del_script
		mostrar_banner
		listar_configurar_odyssint
		;;
	S)
		salir_del_script
		mostrar_banner
		listar_configurar_odyssint
		;;
	*)
		echo -e
		echo -e "${bred}Opción inválida"${end}
		continuar
		listar_configurar_odyssint
		;;
	esac

}

# Función para actualizar el sistema e instalar requerimientos
function actualizar_sistema_y_requerimientos() {

	echo -e ${bgreen}"------------------------------------------------------------------------------------------------------"${end}${ogreen}
	echo -e ${bwhite}"                           CONFIGURACIÓN OdysSINT > SISTEMA Y REQUERIMIENTOS                          "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"------------------------------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${byellow}" Se va a actualizar el sistema e instalar las siguientes aplicaciones requeridas:"${end} | tee -a >(log) 2>&1
	for app in "${requerimientos[@]}"; do
		echo -e " - ${blue}$app"${end} | tee -a >(log) 2>&1
	done
	echo -e
	echo -e ${red}   "IMPORTANTE: Se solicitará permisos de root."${end}
	echo -e ${bgreen}"------------------------------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona 'S/s' para confirmar y cualquier otra tecla para volver: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		echo -e ${bpurple}"Instalando requerimientos..."${end} | tee -a >(log) 2>&1
	else
		mostrar_banner
		listar_configurar_odyssint
	fi
	
	echo -e ${bpurple}"Resolviendo dependencias..."${end} | tee -a >(log) 2>&1
	echo "--- COMANDO: apt --fix-broken install" | log
	sudo apt --fix-broken install -y 2>&1 | log

	echo -e ${bpurple}"Actualizando repositorios..."${end} | tee -a >(log) 2>&1
	echo "--- COMANDO: apt update" | log
	sudo apt update 2>&1 | log
	if [ $? -eq 0 ]; then
		echo -e "${bgreen}Repositorios actualizados correctamente."${end} | tee -a >(log) 2>&1
	else
		echo -e ${bred}"Error al actualizar repositorios."${end} | tee -a >(log) 2>&1
	fi

	echo -e ${bpurple}"Actualizando sistema..."${end} | tee -a >(log) 2>&1
	echo "--- COMANDO: apt -y upgrade" | log
	# sudo apt -y upgrade 2>&1 | log
	if [ $? -eq 0 ]; then
		echo -e "${bgreen}Sistema actualizado correctamente."${end} | tee -a >(log) 2>&1
	else
		echo -e ${bred}"Error al actualizar el sistema."${end} | tee -a >(log) 2>&1
	fi
	# Instalar cada aplicación y verificar la instalación
	for app in "${requerimientos[@]}"; do
		if ! command -v "$app" &>/dev/null; then
			echo -e ${bpurple}"Instalando $app..."${end} | tee -a >(log) 2>&1
			echo "--- COMANDO: apt-get install -y $app" | log
			sudo apt-get install -y $app 2>&1 | log
			if [ $? -eq 0 ]; then
				echo -e "${bgreen}$app instalado correctamente."${end} | tee -a >(log) 2>&1
			else
				echo -e ${bred}"Error al instalar $app. Revisa los logs... "${end} | tee -a >(log) 2>&1
				continuar
			fi
		else
			echo -e "${bgreen}$app ya instalado."${end} | tee -a >(log) 2>&1
		fi
	done
	echo -e ${bgreen}"Finalizada instalación de requerimientos."${end} | tee -a >(log) 2>&1
	continuar
	instalar_herramientas_osint
}

# Función para instalar todas las herramientas OSINT
function instalar_herramientas_osint() {

	echo -e ${bgreen}"------------------------------------------------------------------------------------------------------"${end}${ogreen}
	echo -e ${bwhite}"                        CONFIGURACIóN OdysSINT > INSTALAR HERRAMIENTAS OSINT                          "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"------------------------------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${byellow}" Se va instalar las siguientes aplicaciones OSINT:"${end} | tee -a >(log) 2>&1
	for app in "${aplicacionesOSINT[@]}"; do 
		echo -e " - ${blue}$app"${end} | tee -a >(log) 2>&1
	done
	echo -e ${bgreen}"------------------------------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona 'S/s' para confirmar y cualquier otra tecla para volver: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		echo -e ${bpurple}"Iniciando instalación:"${end} | tee -a >(log) 2>&1
	else
		mostrar_banner
		mostrar_menu_principal
	fi

	#Funciones de instalación de herramientas OSINT
	instalar_theharvester
	instalar_recon-ng
	instalar_spiderfoot
	instalar_maltego
	instalar_zotero
	instalar_nexfil
	instalar_photon
	instalar_archivebox

	echo -e ${bgreen}"Instalación de herramientas OSINT completada."${end} | tee -a >(log) 2>&1
	continuar
	listar_configurar_odyssint
}

# Función para comprobar e instalar requerimeintos si no están instalados
function comprobar_requerimientos() {
	echo -e "${bpurple}Comprobando requerimientos..."${end} | tee -a >(log) 2>&1
	for app in "${requerimientos[@]}"; do
		if ! command -v "$app" &>/dev/null; then
			echo "--- COMANDO: sudo apt-get install -y "$app"" | log
			sudo apt-get install -y "$app" 2>&1 | log
		fi
	done
}

# Función para descargar e instalar theHarvester
function instalar_theharvester() {
	if [ ! -f "$odyssinthome/theharvester/theHarvester.py" ]; then
		echo -e ${bpurple}"Descargando theHarvester desde GitHub..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: git clone https://github.com/laramies/theHarvester.git $odyssinthome/theharvester" | log
		git clone https://github.com/laramies/theHarvester.git $odyssinthome/theharvester 2>&1 | log
		#Montar entorno virtual
		configurar_virtualenv  "theharvester"
		# Instalar TheHarvester
		echo -e ${bpurple}"Instalando theHarvester..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: python3 -m pip install -r requirements/dev.txt" | log
		python3 -m pip install -r requirements/dev.txt 2>&1 | log
		echo "--- COMANDO: python3 -m pip install -r requirements/base.txt" | log
		python3 -m pip install -r requirements/base.txt 2>&1 | log
		# Comprueba que se ha instalado
		if [ -f $odyssinthome/theharvester/theHarvester.py ]; then
			echo -e ${bgreen}"theHarvester instalado correctamente."${end} | tee -a >(log) 2>&1
		else
			echo -e ${bred}"Error al instalar theHarvester. Verifica los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	else
		echo -e ${bgreen}"theHarvester ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para descargar e instalar Recon-ng
function instalar_recon-ng() {
	if [ ! -f $odyssinthome/recon-ng/recon-ng ]; then
		echo -e ${bpurple}"Descargando Recon-ng desde GitHub..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: git clone https://github.com/lanmaster53/recon-ng.git $odyssinthome/recon-ng" | log
		git clone https://github.com/lanmaster53/recon-ng.git $odyssinthome/recon-ng 2>&1 | log
		#Montar entorno virtual
		configurar_virtualenv "Recon-ng"
		# Instalar Recon-ng
		echo -e ${bpurple}"Instalando Recon-ng..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: python3 -m pip install -r REQUIREMENTS" | log
		python3 -m pip install -r REQUIREMENTS 2>&1 | log
		# Comprueba que se ha instalado
		if [ -f $odyssinthome/recon-ng/recon-ng ]; then
			echo -e ${bgreen}"Recon-ng instalado correctamente."${end} | tee -a >(log) 2>&1
		else
			echo -e ${bred}"Error al instalar Recon-ng. Verifica los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	else
		echo -e ${bgreen}"Recon-ng ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para descargar e instalar Spiderfoot
function instalar_spiderfoot() {
	if [ ! -f $odyssinthome/spiderfoot/sfcli.py ]; then
		echo -e ${bpurple}"Descargando spiderfoot desde GitHub..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: git clone https://github.com/smicallef/spiderfoot.git $odyssinthome/spiderfoot" | log
		git clone https://github.com/smicallef/spiderfoot.git $odyssinthome/spiderfoot 2>&1 | log
		#Montar entorno virtual
		configurar_virtualenv "Spiderfoot"
		# Instalar Spiderfoot
		echo -e ${bpurple}"Instalando Spiderfoot..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: pip3 install -r requirements.txt" | log
		pip3 install -r requirements.txt 2>&1 | log
		# Comprueba que se ha instalado
		if [ -f $odyssinthome/spiderfoot/sfcli.py ]; then
			echo -e ${bgreen}"Spiderfoot instalado correctamente."${end} | tee -a >(log) 2>&1
		else
			echo -e ${bred}"Error al instalar Spiderfoot. Verifica los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	else
		echo -e ${bgreen}"Spiderfoot ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para descargar e instalar Maltego
function instalar_maltego() {
	if ! command -v maltego &>/dev/null; then
		# Descarga e instala Maltego
		echo -e ${bpurple}"Descargando Maltego..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: wget --directory-prefix=$odyssinthome/maltego https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.6.0.deb" | log
		wget --directory-prefix=$odyssinthome/maltego https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.6.0.deb 2>&1 | log
		# Cambiar al directorio de Maltego
		cd $odyssinthome/maltego
		# Instalar Maltego
		echo -e ${bpurple}"Instalando Maltego..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: sudo dpkg -i Maltego.v4.6.0.deb" | log
		sudo dpkg -i Maltego.v4.6.0.deb 2>&1 | log
		echo "--- COMANDO: sudo apt install -f" | log
		sudo apt install -f 2>&1 | log
		# Comprueba que se ha instalado
		if command -v maltego &>/dev/null; then
			echo -e ${bgreen}"Maltego instalado correctamente."${end} | tee -a >(log) 2>&1
			echo "--- COMANDO: rm -rf Maltego.v4.6.0.deb" | log
			rm -rf Maltego.v4.6.0.deb 2>&1 | log
		else
			echo -e ${bred}"Error al instalar Maltego. Verifica los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	else
		echo -e ${bgreen}"Maltego ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para instalar ArchiveBox
function instalar_archivebox() {
	if [ ! -d $odyssinthome/archivebox/data/ ]; then
		mkdir -p $odyssinthome/archivebox/ 2>&1 | log
		#Montar entorno virtual
		configurar_virtualenv "ArchiveBox"
		mkdir -p data && cd $odyssinthome/archivebox/data # NO PASAR A LOG
		# Instalar ArchiveBox
		echo -e ${bpurple}"Instalando Archivebox..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: pip3 install --upgrade archivebox yt-dlp playwright" | log
		pip3 install --upgrade archivebox yt-dlp playwright 2>&1 | log
		echo "--- COMANDO: playwright install --with-deps chromium" | log
		playwright install --with-deps chromium 2>&1 | log
		echo -e ${bpurple}"Inicializando Archivebox..."${end} | tee -a >(log) 2>&1
		echo -e ${bred}"IMPORTANTE: No olvidar usuario y contraseña, necesario para administrar entorno..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: archivebox init --setup | tee -a >(log)" | log
		archivebox init --setup
		wait $!
		# Comprueba que se ha instalado
		if [ -d $odyssinthome/archivebox/data/ ]; then
			echo -e ${bgreen}"ArchiveBox instalado correctamente."${end} | tee -a >(log) 2>&1
		else
			echo -e ${bred}"Error al instalar ArchiveBox. Verifica los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	else
		echo -e ${bgreen}"ArchiveBox ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para descargar e instalar Zotero
function instalar_zotero() {
	if ! command -v $odyssinthome/zotero/zotero &>/dev/null; then
		# Descarga e instala Zotero
		mkdir -p $odyssinthome/zotero
		# Cambiar al directorio de Zotero
		cd $odyssinthome/zotero
		echo -e ${bpurple}"Descargando Zotero..."${end} | tee -a >(log) 2>&1
		wget -O zotero.tar.bz2 "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64" 2>&1 | log
		# Instalar Zotero
		echo -e ${bpurple}"Instalando Zotero..."${end} | tee -a >(log) 2>&1
		tar -xjf zotero.tar.bz2 --strip-components=1 2>&1 | log
		./set_launcher_icon
		rm ~/.local/share/applications/zotero.desktop 2>&1 | log
		ln -s $odyssinthome/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
		# Comprueba que se ha instalado
		if command -v $odyssinthome/zotero/zotero &>/dev/null; then
			echo -e ${bgreen}"Zotero instalado correctamente."${end} | tee -a >(log) 2>&1
			rm -rf $odyssinthome/zotero/zotero.tar.bz2 # Borrar la descarga

		else
			echo -e ${bred}"Error al instalar Zotero. Verifica los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	else
		echo -e ${bgreen}"Zotero ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para descargar e instalar Photon
function instalar_photon() {
	if [ ! -f $odyssinthome/photon/photon.py ]; then
		echo -e ${bpurple}"Descargando Photon desde GitHub..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: git clone https://github.com/s0md3v/Photon $odyssinthome/photon" | log
		git clone https://github.com/s0md3v/Photon $odyssinthome/photon 2>&1 | log
		#Montar entorno virtual
		configurar_virtualenv "Photon"
		# Instalar Photon
		echo -e ${bpurple}"Instalando Photon..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: pip install -r requirements.txt" | log
		python3 -m pip install -r requirements.txt 2>&1 | log
		# Comprueba que se ha instalado
		if [ -f $odyssinthome/photon/photon.py ]; then
			echo -e ${bgreen}"Photon instalado correctamente."${end} | tee -a >(log) 2>&1
		else
			echo -e ${bred}"Error al instalar Photon. Verifica los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	else
		echo -e ${bgreen}"Photon ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para instalar Nexfil
function instalar_nexfil() {
	# Instala Nexfil
	if [ ! -d "$odyssinthome/nexfil" ]; then
		mkdir -p $odyssinthome/nexfil/
		#Montar entorno virtual
		configurar_virtualenv "Nexfil"
		# Instalar Nexfil
		echo -e ${bpurple}"Instalando Nexfil..."${end} | tee -a >(log) 2>&1
		pip install nexfil 2>&1 | log
		if [ -d $odyssinthome/nexfil ]; then
			echo -e ${bgreen}"Nexfil instalado correctamente."${end} | tee -a >(log) 2>&1
		else
			echo -e ${bred}"Error al instalar Nexfil. Verifica los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	else
		echo -e ${bgreen}"Nexfil ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para instalar las herramientas complementarias
function instalar_herramientas_complementarias() {

	echo -e ${bgreen} "------------------------------------------------------------------------------------------------------"${end}${ogreen}
	echo -e ${bwhite} "                     CONFIGURACIóN OdysSINT > INSTALAR HERRAMIENTAS COMPLEMENTARIAS                   "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen} "------------------------------------------------------------------------------------------------------"${end}
	echo -e
	# Lista de aplicaciones complementarias a

	echo -e ${byellow}" Se va instalar las siguientes aplicaciones complementarias:"${end} | tee -a >(log) 2>&1
	for app in "${aplicacionesComplementarias[@]}"; do
		echo -e "- ${blue}$app"${end} | tee -a >(log) 2>&1
	done
	echo -e
	echo -e ${red}    " IMPORTANTE: Se va a solicitar permiso de root."${end}
	echo -e ${bgreen} "------------------------------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona 'S/s' para confirmar y cualquier otra tecla para volver: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		echo -e ${bpurple}"\nIniciando instalación:"${end} | tee -a >(log) 2>&1
	else
		mostrar_banner
		listar_configurar_odyssint
	fi
	# Instalar cada aplicación y verificar la instalación
	for app in "${aplicacionesComplementarias[@]}"; do
		# Pone en minuscula la aplicación
		app_lower="${app,,}"
		if ! command -v $app_lower &>/dev/null; then
			echo -e ${bpurple}"Instalando $app..."${end} | tee -a >(log) 2>&1
			echo "--- COMANDO: apt-get install -y $app_lower" | log
			sudo apt-get install -y $app_lower 2>&1 | log
			if [ $? -eq 0 ]; then
				echo -e "${bgreen}$app instalado correctamente."${end} | tee -a >(log) 2>&1
			else
				echo -e ${bred}"Error al instalar $app. Revisal los logs. Presiona cualquier tecla para continuar..."${end} | tee -a >(log) 2>&1
				read -n 1 -r -s
				return 1
			fi
		else
			echo -e ${bgreen}"Apliación $app ya instalada..."${end} | tee -a >(log) 2>&1
		fi
	done
	#Instalo Zenmap
	instalar_zenmap
	echo -e ${bgreen}"Instalación de herramientas complementarias completada."${end} | tee -a >(log) 2>&1
	continuar
	listar_configurar_odyssint
}

# Función para instalar Zenmap
function instalar_zenmap() {
	if ! command -v zenmap &>/dev/null; then
		# Descarga e instala Zenmap
		echo -e ${bpurple}"Descargando Zenmap..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: wget --directory-prefix=$odyssinthome/zenmap https://nmap.org/dist/zenmap-7.94-1.noarch.rpm" | log
		wget --directory-prefix=$odyssinthome/zenmap https://nmap.org/dist/zenmap-7.94-1.noarch.rpm 2>&1 | log
		# Cambiar al directorio de Zenmap
		cd $odyssinthome/zenmap
		# Instalar Zenmap
		echo -e ${bpurple}"Instalando Zenmap..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: sudo alien zenmap-7.94-1.noarch.rpm" | log
		sudo alien zenmap-7.94-1.noarch.rpm 2>&1 | log
		echo "--- COMANDO: sudo dpkg --install zenmap*.deb" | log
		sudo dpkg --install zenmap*.deb 2>&1 | log
		if command -v zenmap &>/dev/null; then
			echo -e ${bgreen}"Zenmap instalado correctamente."${end} | tee -a >(log) 2>&1
			echo "--- COMANDO: rm -rf zenmap-7.94-1.noarch.rpm" | log
			rm -rf zenmap-7.94-1.noarch.rpm 2>&1 | log
		else
			echo -e ${bred}"Error al instalar Zenmap. Verifica los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	else
		echo -e ${bgreen}"Zenmap ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para instalar Tor Browser
function instalar_tor() {
	if ! command -v tor-browser &>/dev/null; then
		# Descarga Tor Browser
		echo -e ${bpurple}"Descargando Tor Browser..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: wget --directory-prefix=$odyssinthome https://dist.torproject.org/torbrowser/13.0.10/tor-browser-linux-x86_64-13.0.10.tar.xz" | log
		wget --directory-prefix=$odyssinthome https://dist.torproject.org/torbrowser/13.0.10/tor-browser-linux-x86_64-13.0.10.tar.xz 2>&1 | log
		# Cambiar al directorio de Tor Browser
		cd $odyssinthome
		# Extraer Tor Browser
		echo -e ${bpurple}"Extrayendo Tor Browser..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: tar -xf tor-browser-linux-x86_64-13.0.10.tar.xz" | log
		tar -xf tor-browser-linux-x86_64-13.0.10.tar.xz 2>&1 | log
		cd tor-browser
		if command -v ./start-tor-browser.desktop &>/dev/null; then
			echo -e ${bgreen}"Tor Browser instalado correctamente."${end} | tee -a >(log) 2>&1
			rm -rf $odyssinthome/tor-browser-linux-x86_64-13.0.10.tar.xz 2>&1 | log
		else
			echo -e ${bred}"Error al instalar Tor Browser. Verifica los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	else
		echo -e ${bgreen}"Tor Browser ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para configurar Firefox
function configurar_firefox() {

	echo -e ${bgreen}"------------------------------------------------------------------------------------------------------"${end}${ogreen}
	echo -e ${bwhite}"                            CONFIGURACIóN OdysSINT > CONFIGURAR FIREFOX                               "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"------------------------------------------------------------------------------------------------------"${end}
	echo -e
	
	echo -e ${byellow}" Se va a configurar un nuevo perfil en firefox con las extensiones y los marcadores de OdysSINT."${end} | tee -a >(log) 2>&1
	echo -e
	echo -e ${bgreen}"------------------------------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona 'S/s' para confirmar y cualquier otra tecla para volver: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		echo -e ${bpurple}"Iniciando configuración:"${end} | tee -a >(log) 2>&1
	else
		mostrar_banner
		listar_configurar_odyssint
	fi
	instalar_perfil_firefox
	mostrar_banner
	listar_configurar_odyssint
}

# Función para crear nuevo perfil en Firefox con extensiones y marcadores.
function instalar_perfil_firefox() {
    # Verificar si Firefox está instalado
    if ! command -v firefox &>/dev/null; then
        comprobar_requerimientos
    fi

    # URL del archivo tar.bz2
    url="https://github.com/javi-ag/OdysSINT/raw/main/firefoxprofile.ulysses.tar.xz"

    # Directorio de destino
    destino="$HOME/.mozilla/firefox/"

    # Descargar el archivo tar.bz2
    echo -e "${bpurple}Descargando el perfil Firefox del github de OdysSINT...${end}" | tee -a >(log) 2>&1
    #if wget -q --show-progress -O firefoxprofile.ulysses.tar.xz "$url"; then
    #    echo -e "${bgreen}Descarga completa.${end}" | tee -a >(log) 2>&1
    #else
    #    echo -e "${bred}Error al descargar el archivo.${end}" | tee -a >(log) 2>&1
    #    return 1
    #fi

    # Extraer el archivo tar.bz2 sobrescribiendo la carpeta si existe
    echo -e "${bpurple}Extrayendo el archivo...${end}" | tee -a >(log) 2>&1
	echo "--- COMANDO: tar -xjf $odyssinthome/.mozilla/firefox/firefoxprofile.ulysses.tar.xz -C $destino --overwrite" | log
    tar -xJf $odyssinthome/firefox/firefoxprofile.ulysses.tar.xz -C "$destino" --overwrite
	if [ ! -f "$HOME/.mozilla/firefox/firefoxprofile.ulysses.tar.xz" ]; then
        echo -e "${bgreen}Extracción completa.${end}" | tee -a >(log) 2>&1
    else
        echo -e "${bred}Error al extraer el archivo.${end}" | tee -a >(log) 2>&1
        return 1
    fi

    # Realizar un backup del archivo profiles.ini
    echo "--- COMANDO: cp $destino/profiles.ini $destino/profiles.ini_backup" | log
	if cp "$destino/profiles.ini" "$destino/profiles.ini_backup"; then
        echo -e "${bgreen}Backup profiles.ini realizado.${end}" | tee -a >(log) 2>&1
		nuevo_perfil="[Profile2]\nName=Ulysses\nIsRelative=1\nPath=firefoxprofile.ulysses\nDefault=1\n"
		echo -e "$nuevo_perfil" >> "$destino/profiles.ini"
		echo -e "${bgreen}Perfil de firefox agregado.${end}" | tee -a >(log) 2>&1
    else
        echo -e "${bred}Error al realizar el backup.${end}" | tee -a >(log) 2>&1
        return 1
    fi
    echo -e "${bpurple}Firefox se ha configurado correctamente.${end}" | tee -a >(log) 2>&1
	continuar
}

# Función para actualizar el script desde GitHub y volver a ejecutarlo
function actualizar_y_ejecutar_script() {

	echo -e ${bgreen}"------------------------------------------------------------------------------------------------------"${end}${ogreen}
	echo -e ${bwhite}"                           CONFIGURACIÓN OdysSINT > ACTUALIZAR SCRIPT                                 "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"------------------------------------------------------------------------------------------------------"${end}
	echo -e

	echo -e ${byellow}"Se va a actualizar el script desde la versión $script_version a la versión $script_version_github"${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"Para revisar los cambios visitar https://github.com/javi-ag/OdysSINT"${end}
	echo -e ${bred}"IMPORTANTE: Tras actualizarse se reiniciará el script."${end}
	echo -e
	echo -e ${bgreen}"------------------------------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona 'S/s' para confirmar y cualquier otra tecla para volver: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		echo -e ${bpurple}"Actualizando script..."${end} | tee -a >(log) 2>&1
	else
		mostrar_banner
		listar_configurar_odyssint
	fi
	wget -O "$script_name" "$odyssint_github_url" 2>&1 | log
	chmod +x "$script_name" 2>&1 | log
	echo -e ${bgreen}"Script actualizado a la versión $script_version_github, se va a reiniciar su ejecución"${end} | tee -a >(log) 2>&1
	continuar
	./"$nombre_script"
}

# Función eliminar herramientas instaladas y limpiar directorio de OdysSINT
function desinstalar_odyssint() {

	echo -e ${bred}  "------------------------------------------------------------------------------------------------------"${end}${ored}
	echo -e ${bwhite}"                           CONFIGURACIÓN OdysSINT > DESINSTALAR OdysSINT                              "${end} | tee -a >(log) 2>&1
	echo -e ${bred}  "------------------------------------------------------------------------------------------------------"${end}
	echo -e
	
	# Borramos aplicaciones requeridas
	echo -e ${byellow}"Las siguientes aplicaciones requeridas serán desinstaladas:"${end} | tee -a >(log) 2>&1
	for app in "${requerimientos[@]}"; do
		echo -e ${bred}" - $app"${end} | tee -a >(log) 2>&1
	done
	echo -e
	echo -e ${bred}"------------------------------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona 'S/s' para confirmar y cualquier otra tecla para continuar: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		for app in "${requerimientos[@]}"; do
			echo "--- COMANDO: apt-get remove -y $app" | log
			echo -e ${bpurple}"Desinstalando $app..."${end} | tee -a >(log) 2>&1
			sudo apt-get remove -y $app 2>&1 | log
		done
		echo -e ${bgreen}"Aplicaciones requeridas desinstaladas"${end} | tee -a >(log) 2>&1
	fi

	# Borramos aplicaciones complementarias
	mostrar_banner
	echo -e ${bred}  "------------------------------------------------------------------------------------------------------"${end}${ored}
	echo -e ${bwhite}"                           CONFIGURACIÓN OdysSINT > DESINSTALAR OdysSINT                              "${end} | tee -a >(log) 2>&1
	echo -e ${bred}  "------------------------------------------------------------------------------------------------------"${end}
	echo -e
	
	echo -e ${byellow}"¿Eliminar las siguientes aplicaciones complementarias?  (S/n):"${end} | tee -a >(log) 2>&1
	for app in "${aplicacionesComplementarias[@]}"; do
		echo -e ${bred}" - $app"${end} | tee -a >(log) 2>&1
	done
	echo -e
	echo -e ${bred}"------------------------------------------------------------------------------------------------------"${end}
	
	read -p "$(echo -e ${byellow}"Presiona 'S/s' para confirmar y cualquier otra tecla para continuar: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		for app in "${aplicacionesComplementarias[@]}"; do
			echo "--- COMANDO: apt-get remove -y $app" | log
			echo -e ${bpurple}"Desinstalando $app..."${end} | tee -a >(log) 2>&1
			sudo apt-get remove -y $app 2>&1 | log
		done
		echo -e ${bgreen}"Aplicaciones complementarias desinstaladas"${end} | tee -a >(log) 2>&1
	fi
	
	# Borramos aplicaciones OSINT y carpeta de trabajo de OdysSINT
	mostrar_banner
	echo -e ${bred}  "------------------------------------------------------------------------------------------------------"${end}${ored}
	echo -e ${bwhite}"                           CONFIGURACIÓN OdysSINT > DESINSTALAR OdysSINT                              "${end} | tee -a >(log) 2>&1
	echo -e ${bred}  "------------------------------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${byellow}"Se va a eliminar la carpeta de trabajo OdysSINT y las siguientes herramientas OSINT:"${end} | tee -a >(log) 2>&1
	for app in "${aplicacionesOSINT[@]}"; do
		echo -e ${bred}"- $app"${end} | tee -a >(log) 2>&1
	done
	echo -e
	echo -e ${bred}"------------------------------------------------------------------------------------------------------"${end}
	
	read -p "$(echo -e ${byellow}"Presiona 'S/s' para confirmar y cualquier otra tecla para continuar: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		echo -e ${bpurple}"Desinstalando Maltego..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: apt-get remove -y maltego" | log
		sudo apt remove -y maltego  2>&1 | log
		echo -e ${bpurple}"Herramientas OSINT eliminadas..."${end}
		echo "--- COMANDO: rm -rf $odyssinthome" | log
		rm -rf $odyssinthome  2>&1 | log
		echo -e ${bpurple}"Carpeta eliminada..."${end}
		rm -rf "$HOME/.mozilla/firefox/firefoxprofile.ulysses"
		mv "$HOME/.mozilla/firefox/profiles.ini_backup" "$HOME/.mozilla/firefox/profiles.ini"
		echo -e ${bpurple}"Eliminado perfil Ulysses de Firefox y recuperada configuración anterior..."${end}
	else
		mostrar_banner
		listar_configurar_odyssint
	fi
	./"$nombre_script"	
}

###### FUNCIONES VARIAS ######

# Comprobar si la carpeta $odyssinthome existe, si no la crea
function comprobar_directorio() {
	if [ ! -d "$odyssinthome" ]; then
		mkdir -p $odyssinthome
		touch "NO_BORRAR_ESTA_CARPETA"
		mkdir -p $odyssinthome/logs/
		mostrar_banner
		echo -e ${bgreen}"Se ha creado el directorio de trabajo en $odyssinthome."${end} | tee -a >(log) 2>&1
		continuar
	fi
	# Imprimo un primer mensaje en log con inicio y versión de script.
	echo "------------- INICIO EJECUCIÓN SCRIPT - VERSIÓN ACTUAL OdysSINT $script_version -------------" | log
}

# Función para escribir en el log con fecha y hora, eliminando los códigos de escape ANSI
function log() {
	while IFS= read -r line; do
		echo "[$(date +'%Y-%m-%d %H:%M:%S')] $(echo "$line" | sed -r "s/\x1B\[[0-9;]*[mGKHJ]//g")" >>"$logfile"
	done
}

# Función para salir del script
function salir_del_script() {
	echo -e
	echo -e ${byellow}"¿Estás seguro de que quieres salir del script? Presiona 'S/s' para confirmar."${end}
	read -n1 -s tecla
	if [[ $tecla == "S" || $tecla == "s" ]]; then
		color=$(color_random)
		#echo -e ${color}"¡Hasta luego!"${end}
		echo -e "${bgreen}¡${bred}H${bblue}a${byellow}s${bpurple}t${bcyan}a ${bblack}p${bgreen}r${bred}o${bblue}n${byellow}t${bpurple}o${bcyan}!"${end}
		exit
	fi
	mostrar_banner
	mostrar_menu_principal
}

#Función que permite pulsar ctrl+c en cualquier momento.
function ctrl_c() {
	echo
	salir_del_script
	tput cnorm
	exit 0
}

# Función para parar y pedir continuar
function continuar() {
	echo -e ${byellow}"Pulsa cualquier tecla para continuar"${end}
	read -n 1 -r
	mostrar_banner
}

function configurar_virtualenv (){
		local herramienta="${1,,}"
		echo -e ${bpurple}"Montando entorno virtual..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: virtualenv -p /usr/bin/python3 $odyssinthome/$herramienta/venv" | log
		virtualenv -p /usr/bin/python3 $odyssinthome/$herramienta/venv 2>&1 | log
		# Compruebo en que ubicación ha montado el entorno virtual
		if [ -d "$odyssinthome/$herramienta/venv/local" ]; then
			venv_path=/local
		fi
		echo "--- COMANDO: source $odyssinthome/$herramienta/venv/bin/activate" | log
		source $odyssinthome/$herramienta/venv"$venv_path"/bin/activate #NO PASAR A LOG, SI NO FALLA
		# Cambiar al directorio de la herramienta
		echo "--- COMANDO: cd $odyssinthome/$herramienta" | log
		cd $odyssinthome/$herramienta
}


#Función para comprobar donde se ha instalado la activación del entorno virtual. Compatibilidad con Debian
function comprobar_virtualenv (){
		local herramienta="${1,,}"
		# Compruebo en que ubicación ha montado el entorno virtual
		if [ -d "$odyssinthome/$herramienta/venv/local" ]; then
			venv_path=/local
		fi
		echo "--- COMANDO: cd $odyssinthome/$herramienta" | log
		cd $odyssinthome/$herramienta/venv"$venv_path"/bin
}

# Funcion que comprueba e instala la herramienta
function instalar (){
		local herramienta="${1//_/ }"
		local herramienta_min="${1,,}"
			echo -e ${byellow}"$herramienta no está instalado. ¿Desea instalarlo ahora? (s/n)."${end} | tee -a >(log) 2>&1
			read -p "$(echo -e ${bred}"IMPORTANTE: Se solicitarán permisos root si los requerimientos no están instalados"${end})" -n 1 -r confirmacion
			echo -e
			if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
				verificar_conexion_internet
				comprobar_requerimientos
				instalar_"$herramienta_min"
				if [ $? -eq 1 ]; then
					mostrar_banner
					mostrar_menu_principal
				fi
			else
				mostrar_banner
				mostrar_menu_principal	
			fi
}

# Función para comprobar si el script está actualizado
function comprobar_version() {

	# Intentar leer el archivo desde GitHub
	script_odyssint=$(curl -sSfL "$odyssint_github_url")

	# Verificar si se pudo leer el archivo
	if [ -z "$script_odyssint" ]; then
		declare -g script_version_update="(Repositorio OdysSINT no disponible)"
		mostrar_banner
		echo -e ${bred}"ERROR: No se ha podido verificar el repositorio de OdysSINT."${end} | tee -a >(log) 2>&1
		continuar
		return 1
	fi

	# Obtener la versión del script desde el contenido obtenido
	script_version_github=$(echo "$script_odyssint" | grep '^declare script_version=' | cut -d '=' -f 2 | tr -d '"')

	# Verificar si se encontró la versión del script
	if [ -z "$script_version" ]; then
		declare -g script_version_update="(Error script repositorio)"
		mostrar_banner
		echo -e ${bred}"ERROR: No se ha podido verificar la versión del script de OdysSINT."${end} | tee -a >(log) 2>&1
		continuar
		return 1
	fi

	# Comparar versiones
	if [[ "$script_version" == "$script_version_github" ]]; then
		declare -g script_version_update=${end}${bgreen}"(Script en última versión)"${end}
		echo "------------- COMPROBACIÓN DE VERSIÓN CORRECTA - SCRIPT ACTUALIZADO  -------------" | log
		mostrar_banner
	elif [[ "$script_version" < "$script_version_github" ]]; then
		declare -g script_version_update=${bgreen}"(Actualización $script_version_github disponible)"${end}
		mostrar_banner
		echo -e ${bgreen}"Actualización de OdysSINT disponible ($script_version_github), actualiza script desde el menú de configuración."${end} | tee -a >(log) 2>&1
		continuar
	else
		declare -g script_version_update="(Versión de script incorrecta)"
		mostrar_banner
		echo -e ${bred}"ERROR: Versión de script incorrecta ($script_version). Versión actual de OdysSINT ($script_version_github)."${end} | tee -a >(log) 2>&1
		echo -e ${bred}"Descarga de nuevo el script del repositorio $odyssint_github_url"${end}
		continuar
	fi
}

# Función para comprobar si somos ROOT
function verificar_root() {
	if [ "$(id -u)" == "0" ]; then
		mostrar_banner
		echo -e ${bred}"Para un correcto uso no ejecutar con permisos de root."${end}
		echo -e ${bred}"El script solicitará elevar privilegios cuando sea necesario."${end} | tee -a >(log) 2>&1
		continuar
		clear
		exit 1
	fi
}

# Función para verificar la conexión a Internet
function verificar_conexion_internet() {
	echo
	if ! ping -q -c 1 -W 1 google.com >/dev/null; then
		read -p "$(echo -e ${bred}"No hay conexión a Internet. Por favor, verifique su conexión y vuelva a intentarlo."${end}) " -n 1 -r confirmacion
		declare -g script_version_update="(Comprobar conexión a Internet)"
		mostrar_banner
		echo -e "${warning}\t\t\t\tMAXIMIZAR VENTANA PARA MEJOR EXPERIENCIA"${end}
		mostrar_menu_principal
	else
	comprobar_version
	fi

}

# Función para abrir el fichero de log actual
function abrir_log() {
	gnome-terminal -- $SHELL -c "tail -f $logfile; exec $SHELL"
	echo -e ${bgreen}"Log abierto en una nueva ventana."${end} | tee -a >(log) 2>&1
	continuar
}

# Función para seleccionar un color aleatorio
function color_random() {
	# Seleccionar un color aleatorio
	# Colores disponibles
	colores=("bred" "bgreen" "bblue" "abcyan" "byellow" "bwhite" "bblack")
	random_color="${colores[RANDOM % ${#colores[@]}]}"
	echo -e "${!random_color}"
}

###### INICIO SCRIPT ######

trap ctrl_c INT
# Comprueba que el directorio de trabajo existe
comprobar_directorio
# Comprueba si somos root
verificar_root
# Comprueba internet y la versión del script
verificar_conexion_internet
# Muestra el menú principal
mostrar_banner
echo -e "${warning}\t\t\t\tMAXIMIZAR VENTANA PARA MEJOR EXPERIENCIA"${end}
mostrar_menu_principal
