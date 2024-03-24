#!/bin/bash

# Colores normales
green="\e[0;32m\033[1m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[1;35m\033[1m"
cyan="\e[0;36m\033[1m"
white="\e[0;37m\033[1m"
black="\e[0;30m\033[1m"

# Colores de alta intensidad
bgreen='\033[1;92m'
bred='\033[1;91m'
bblue='\033[1;94m'
byellow='\033[1;93m'
bpurple='\033[1;95m'
bcyan='\033[1;96m'
bwhite='\033[1;97m'
bblack='\033[1;90m'

# Colores de alta intensidad con fondo
ogreen='\033[0;102m'
ored='\033[0;101m'
oblue='\033[0;104m'
oyellow='\033[0;103m'
opurple='\033[0;105m'
ocyan='\033[0;106m'
owhite='\033[0;107m'
oblack='\033[0;100m'

# Colores especiales
end="\033[0m\e[0m"
warning="\e[5;31m\033[1m"

###### VARIABLES ######

# Requerimientos de OdysSINT
declare requerimientos=("git" "python3-full" "python3-pip" "python3-virtualenv" "nodejs" "firefox" "firefox-esr" "openjdk-17-jdk" "curl" "wget" "alien" "tor" "unzip")
# Lista de aplicaciones OSINT
declare aplicacionesOSINT=("theHarvester" "recon-ng" "Spiderfoot" "Maltego" "Zotero" "Nexfil" "Photon" "Geo-recon" "ArchiveBox")
# Lista de aplicaciones complementarias
declare aplicacionesComplementarias=("Terminator" "Onionshare" "KeePassXC" "Notepadqq" "Dia" "VLC" "Audacity" "Flameshot" "Nmap" "7zip")
# URLs repositorio Github OdysSINT
declare odyssint_github_url="https://github.com/javi-ag/OdyssINT"
declare odyssint_script_url="https://github.com/javi-ag/OdysSINT/raw/main/OdysSINT.sh"
declare odyssint_firefox_url="https://github.com/javi-ag/OdysSINT/raw/main/firefoxprofile.ulysses.zip"
# Versión de script
declare script_version=1.0
# Directorio de trabajo de OdysSINT
declare odyssinthome=$HOME/OdysSINT
# Nombre del fichero script
declare nombre_script=$(basename "$0")
# Nombre del archivo de log
declare logfile="$odyssinthome/logs/$(date +'%Y-%m-%d')-OdysSINT.log"

###### FUNCIONES DE MENÚS ######

#Función para mostrar el banner inicial
function mostrar_banner() {
	clear # Limpia la pantalla
	echo -e ${bblack}"                                                                 "
	echo -e "        ██████      ████                 ████  ████ ████   ████ ██████████"
	echo -e "       ██░░░░██    ░░██           ████  ██░░██░░██ ░░████ ░░██ ░█░░░██░░░█"
	echo -e "      ██    ░░██  █████ ████ ███ ██░░   ██░░   ░██  ░██░██ ░██ ░   ░██  ░ "
	echo -e "     ░██     ░██░██ ░██ ░██ ░██ ░░████ ░░████  ░██  ░██░░██░██     ░██    "
	echo -e "     ░░██    ██ ░██ ░██ ░██ ░██  ░░░███  ░░███ ░██  ░██  ░░███     ░██    "
	echo -e "      ░░██████░ ░░██████░░█████  █████  █████  ████ ████  ░░███    ████   "
	echo -e "       ░░░░░░    ░░░░░░  ░░░░██ ░░░░░  ░░░░░  ░░░░ ░░░░░  ░░░░    ░░░░    "
	echo -e "                         ██ ░██  Instalación y uso de herramientas OSINT  "
	echo -e "                        ░░████   v$script_version $script_version_update  "${bblack} # Muestra la versión del script y el mensaje de actualización
	echo -e "                          ░░░                                             "
	echo -e "  \t\t${bgreen}Master Ciberseguridad 12ª Edición"${end}
	echo -e "  \t\t * Autor:  ${bblue}Javier Aguilar"${end}
	echo -e "  \t\t * Tutor:  ${cyan}Juanjo Salvador"${end}
	echo -e "  \t\t * Correo: ${byellow}odyssint@protonmail.com"${end}
	echo -e "  \t\t * Github: ${byellow}$odyssint_github_url"${end}
	echo -e
}

# Función para mostrar el menú principal
function mostrar_menu_principal() {
	echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}${opurple}
	echo -e ${bwhite}"                              MENÚ PRINCIPAL                                    "${end} | tee -a >(log) 2>&1
	echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${bblue}" 1) Herramientas OSINT"${end}
	echo -e ${bcyan}" 2) Herramientas complementarias"${end}
	echo -e ${bpurple}" 3) Firefox con prefil Ulysses"${end}
	echo -e ${bgreen}" 4) Configurar OdysSINT"${end}
	echo -e
	echo -e ${byellow}" s) Salir del script"${end}
	echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${bblack}" Selecciona una opción: "${end})" -n 1 -r menu_principal
	echo -e
	case $menu_principal in	
	1) # Herramientas OSINT
		mostrar_banner
		listar_herramientas_osint
		;;
	2) # Herramientas complementarias
		mostrar_banner
		listar_herramientas_complementarias
		;;
	3) # Marcadores y extensiones en Firefox
		# Verificar si Firefox está instalado
		if [[ ! -d "$HOME/snap/firefox/common/.mozilla/firefox/firefoxprofile.ulysses" && ! -d "$HOME/.mozilla/firefox/firefoxprofile.ulysses" ]]; then
			comprobar_instalar "Perfil_Firefox"
		fi
		# Deshabilitar las advertencias de GTK
		export GTK_MODULES=
		# Lanzar Firefox con perfil Ulysses en una nueva ventana
		echo -e ${bpurple}"Iniciando Firefox..."${end} | tee -a >(log) 2>&1
		gnome-terminal --title="NO CERRAR ESTA VENTANA" -- $SHELL -c "
		echo '----------------------------'
		echo '---- OdysSINT - Firefox ----'
		echo '----------------------------'
		echo '|  NO CERRAR ESTA VENTANA. |'
		echo '|  ACTUALIZAR MARCADORES   |'
		echo '|  CON EXTENSIÓN:          |'
		echo '|  BookmarkHub             |'
		echo '----------------------------' &&
		firefox -P Ulysses && exit; exec $SHELL"
		echo -e ${bgreen}"Firefox iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		mostrar_menu_principal
		;;
	4) # Configurar OdysSINT
		mostrar_banner
		listar_configurar_odyssint
		;;
	S | s) # Sale del script
		salir_del_script
		mostrar_banner
		mostrar_menu_principal
		;;
	*) # Captura las opciones inválidas
		echo -e "${bred}Opción inválida"${end} | tee -a >(log) 2>&1
		continuar
		mostrar_menu_principal
		;;
	esac
}

# Funcion para mostrar ayuda cuando se pasa una opción directamente al script
function mostrar_ayuda() {
	clear # Limpia la pantalla
	mostrar_banner
	echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}${opurple}
	echo -e ${bwhite}"                        AYUDA OPCIONES DESATENDIDAS                             "${end} | tee -a >(log) 2>&1
	echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${bblue}" -i) Instala herramientas OSINT de forma desatendida."${end}
	echo -e ${bcyan}" -c) Instala herramientas complementarias de forma desatendida."${end}
	echo -e ${bpurple}" -e) Instalar Firefox con prefil Ulysses de forma desatendida."${end}
	echo -e ${bgreen}" -a) Actualiza el script de forma desatendida."${end}
	echo -e ${bblack}" -l) Muestra el log actual en una nueva ventana de terminal."${end}
	echo -e ${bred}" -d) DESINSTALA todo OdysSINT.${warning} NO SOLICITA CONFIRMACIÓN"${end}
	echo -e
	echo -e "${bblack}Ejemplo: ./OdysSINT.sh -e${end}"
	echo -e
	exit
}

# Función para mostrar el menú de herramientas OSINT
function listar_herramientas_osint() {
	echo -e ${bblue}"--------------------------------------------------------------------------------"${end}${oblue}
	echo -e ${bwhite}"                              HERRAMIENTAS OSINT                                "${end} | tee -a >(log) 2>&1
	echo -e ${bblue}"--------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${bblue}"  RECOLECCIÓN DE INFORMACIÓN Y RECONOCIMIENTO"
	echo -e ${bblue}" 1) The Harvester:${blue}obtiene emails, IPs y subdominios de diferentes fuentes.(CLI)"
	echo -e ${blue}"    Repo:${white}https://github.com/laramies/theHarvester"
	echo -e ${bblue}" 2) Recon-ng:${blue}framework de automatización para tareas OSINT que ejecuta "
	echo -e ${blue}"    diferentes módulos para recopilar información de forma eficiente (CLI/Web)."
	echo -e ${blue}"    Repo:${white}https://github.com/lanmaster53/recon-ng"
	echo -e ${bblue}" 3) Spiderfoot:${blue}automatiza la recolección de información sobre activos en"
	echo -e ${blue} "   línea desde multiples fuentes, identificando riesgos e inteligencia (Web)."
	echo -e ${blue}"    Repo:${white}https://github.com/smicallef/spiderfoot"
	echo -e ${bblue}" 4) Nexfil:${blue}encuentra nombres de usuarios en más de 300 webs en segundos (CLI)."
	echo -e ${blue}"    Repo:${white}https://github.com/thewhiteh4t/nexfil"
	echo -e ${bblue}" 5) Photon:${blue}rastrea rápidamente webs y recopila URLs, archivos y metadatos (CLI)."
	echo -e ${blue}"    Repo:${white}https://github.com/s0md3v/Photon"
	echo -e ${bblue}" 6) Geo-recon:${blue}Geolocalización de IPs a través de bases de datos públicas (CLI)."
	echo -e ${blue}"    Repo:${white}https://github.com/radioactivetobi/geo-recon"
	echo -e ${bblue}" 7) Maltego:${blue}extrae y analiza datos mediante transformadas representándolos"
	echo -e ${blue} "   de forma visual y permitiendo encontrar relaciones y patrones (App)."
	echo -e ${blue}"    Web:${white}https://www.maltego.com/"
	echo -e ${bcyan}"  OTROS"${end}
	echo -e ${bcyan}" 8) ArchiveBox:${cyan}archivado local de páginas webs para su visualización offline."${end}
	echo -e ${cyan} "   Instalar extensión de Firefox desde configuación de OdysSINT (Web/Add-on)."${end}
	echo -e ${cyan}"    Repo:${white}https://github.com/ArchiveBox/ArchiveBox"
	echo -e ${bcyan}" 9) Zotero:${cyan}gestor de referencias para la organización en las investigaciones"${end}
	echo -e ${cyan} "   Instalar extensión de Firefox desde configuación de OdysSINT (App/Add-on)."${end}
	echo -e ${cyan}"    Web:${white}https://www.zotero.org/"
	echo -e
	echo -e ${byellow}" 0) Volver a menú principal"${end}
	echo -e ${byellow}" s) Salir del script"${end}
	echo -e ${bblue}"--------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${bblack}" Selecciona una opción: "${end})" -n 1 -r herramientas_osint
	echo -e
	case "$herramientas_osint" in
	1) # theHarvester: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if [ ! -f "$odyssinthome/theharvester/theHarvester.py" ]; then
			comprobar_instalar "theHarvester"
		fi
		# Comprueba donde se ha instalado la activación del entorno virtual de python e inicializa la aplicación
		comprobar_virtualenv "theHarvester"
		# Lanza la herramienta en una nueva ventana y muestra la ayuda para lanzar de nuevo
		gnome-terminal -- $SHELL -c "source activate &&	cd $odyssinthome/theharvester/ &&
		$odyssinthome/theharvester/theHarvester.py &&
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
	2) # Recon-ng: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if [ ! -f "$odyssinthome/recon-ng/recon-ng" ]; then
			comprobar_instalar "Recon-ng"
		fi
		# Comprueba donde se ha instalado la activación del entorno virtual de python e inicializa la aplicación
		comprobar_virtualenv "Recon-ng"
		# Lanza la herramienta en una nueva ventana y muestra la ayuda para lanzar de nuevo
		echo "$venv_path"
		gnome-terminal -- $SHELL -c "source activate &&	cd $odyssinthome/recon-ng/ &&
		$odyssinthome/recon-ng/recon-ng -h &&
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
	3) # Spiderfoot: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if [ ! -f "$odyssinthome/spiderfoot/sfcli.py" ]; then
			comprobar_instalar "Spiderfoot"
		fi
		# Comprueba donde se ha instalado la activación del entorno virtual de python e inicializa la aplicación
		comprobar_virtualenv "Spiderfoot"
		# Lanza la herramienta en una nueva ventana
		gnome-terminal --title="CERRAR PARA PARAR SPIDERFOOT" -- $SHELL -c "
		echo '----------------------------'
		echo '-- OdysSINT - Spyderfoot ---'
		echo '----------------------------'
		echo '|  ACCEDER DESDE FIREFOX  > |'
		echo '|  > HERRAMIENTAS LOCALES   |'
		echo '----------------------------'	&&
		source activate &&	cd $odyssinthome/spiderfoot/ &&
				python3 $odyssinthome/spiderfoot/sf.py -l 127.0.0.1:5001 && exit; exec $SHELL"
		echo -e ${bgreen}"Spiderfoot iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_osint
		;;
	4) # Nexfil: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if [ ! -d "$odyssinthome/nexfil" ]; then
			comprobar_instalar "Nexfil"
		fi
		# Comprueba donde se ha instalado la activación del entorno virtual de python e inicializa la aplicación
		comprobar_virtualenv "Nexfil"
		# Lanza la herramienta en una nueva ventana y muestra la ayuda para lanzar de nuevo
		gnome-terminal  --title="OdysSINT - Nexfil" -- $SHELL -c "source activate && cd $odyssinthome/nexfil/venv/bin &&
		$odyssinthome/nexfil/venv/bin/nexfil -h &&
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
	5) # Photon: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if [ ! -f "$odyssinthome/photon/photon.py" ]; then
			comprobar_instalar "Photon"
		fi
		# Comprueba donde se ha instalado la activación del entorno virtual de python e inicializa la aplicación
		comprobar_virtualenv "Photon"
		# Lanza la herramienta en una nueva ventana y muestra la ayuda para lanzar de nuevo
		gnome-terminal --title="OdysSINT - Photon" -- $SHELL -c "source activate &&	cd $odyssinthome/photon/ &&
		python3 $odyssinthome/photon/photon.py &&
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
	6) # Geo-recon: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if [ ! -f "$odyssinthome/geo-recon/geo-recon.py" ]; then
			comprobar_instalar "Geo-recon"
		fi
		# Comprueba donde se ha instalado la activación del entorno virtual de python e inicializa la aplicación
		comprobar_virtualenv "Geo-recon"
		# Lanza la herramienta en una nueva ventana y muestra la ayuda para lanzar de nuevo
		gnome-terminal --title="OdysSINT - Geo-recon" -- $SHELL -c "source activate &&	cd $odyssinthome/geo-recon/ &&
		python3 $odyssinthome/geo-recon/geo-recon.py &&
		echo '-------------------------------------'
		echo '-------  OdysSINT - Geo-recon  ------'
		echo '-------------------------------------'
		echo '|  MODO CLI: python3 geo-recon.py    |' 
		echo '|  AYUDA:    python3 geo-recon.py -h |'
		echo ---------------------------------------; exec $SHELL"
		echo -e ${bgreen}"Geo-recon iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_osint
		;;
	7) # Maltego: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if ! command -v maltego &>/dev/null; then
			comprobar_instalar "Maltego"
		fi
		# Lanza la herramienta en una nueva ventana
		gnome-terminal --title="NO CERRAR ESTA VENTANA" -- $SHELL -c "
		echo '----------------------------'
		echo '---- OdysSINT - Maltego ----'
		echo '----------------------------'
		echo '|  NO CERRAR ESTA VENTANA  |'
		echo '----------------------------' &&
		maltego && exit; exec $SHELL"
		echo -e ${bgreen}"Maltego iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_osint
		;;
	8) # ArchiveBox: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if [ ! -d "$odyssinthome/archivebox/data/" ]; then
			comprobar_instalar "ArchiveBox"
		fi
		# Comprueba donde se ha instalado la activación del entorno virtual de python e inicializa la aplicación
		comprobar_virtualenv "ArchiveBox"
		# Lanza la herramienta en una nueva ventana
		gnome-terminal --title="CERRAR PARA PARAR ARCHIVEBOX" -- $SHELL -c "
		echo '-------------------------------'
		echo '---  OdysSINT - ArchiveBox  ---'
		echo '-------------------------------'
		echo '|    ACCEDER DESDE FIREFOX  >  |'
		echo '|    > HERRAMIENTAS LOCALES    |'
		echo --------------------------------- &&
		source activate &&	cd $odyssinthome/archivebox/data &&
		archivebox server 127.0.0.1:8000; exec $SHELL"
		echo -e ${bgreen}"ArchiveBox iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_osint
		;;
	9) # Zotero: instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if ! command -v "$odyssinthome/zotero/zotero" &>/dev/null; then
			comprobar_instalar "Zotero"
		fi
		# Lanza la herramienta en una nueva ventana
		gnome-terminal --title="NO CERRAR ESTA VENTANA" -- $SHELL -c "
		echo '---------------------------'
		echo '---  OdysSINT - Zotero  ---'
		echo '---------------------------'
		echo '|  NO CERRAR ESTA VENTANA  |'
		echo ----------------------------- &&
		$odyssinthome/zotero/zotero && exit; exec $SHELL"
		echo -e ${bgreen}"Zotero iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		mostrar_banner
		listar_herramientas_osint
		;;
	0) # Vuelve al menú principal
		mostrar_banner
		mostrar_menu_principal
		;;
	S | s) # Sale del script
		salir_del_script
		mostrar_banner
		mostrar_menu_principal
		;;
	*) # Captura las opciones inválidas
		echo -e "${bred}Opción inválida"${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_osint
		;;
	esac
}

# Función para mostrar el menú de herramientas Complementarias
function listar_herramientas_complementarias() {
	echo -e ${bcyan} "-------------------------------------------------------------------------------"${end}${ocyan}
	echo -e ${bwhite}"                          HERRAMIENTAS COMPLEMENTARIAS                          "${end} | tee -a >(log) 2>&1
	echo -e ${bcyan} "-------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${bcyan} "1) Zenamp:${cyan}interfaz gráfica de Nmap, escanea redes y descubre vulnerabilidades"${end}
	echo -e ${bcyan} "2) Tor Browser:${cyan}para navegar anonimamente con el perfil Ulysses por la red Tor."${end}
	echo -e ${bcyan} "3) Terminator:${cyan}gestor de terminales Torificado por Torsocks."${end}
	echo -e ${bcyan} "4) OnionShare:${cyan}comparte archivos de forma segura y anónima mediante la red Tor."${end}
	echo -e ${bcyan} "5) KeePassXC:${cyan}almacena datos y contraseñas de forma segura."${end}
	echo -e ${bcyan} "6) Notepadqq:${cyan}potente editor de texto parecido a Notepad++."${end}
	echo -e ${bcyan} "7) Dia:${cyan}editor de diagramas ideal para generar relaciones en investigaciones."${end}
	echo -e ${bcyan} "8) VLC:${cyan}visualizador y conversor de videos."${end}
	echo -e ${bcyan} "9) Audacity:${cyan}escucha y edita audios."${end}
	echo -e ${bcyan} "c) Flameshot:${cyan}realiza capturas de pantalla y las edita de forma simple."${end}
	echo -e
	echo -e ${byellow}" 0) Volver a menú principal"${end}
	echo -e ${byellow}" s) Salir del script"${end}
	echo -e ${bcyan} "-------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${bblack}" Selecciona una opción: "${end})" -n 1 -r herramientas_complementarias
	echo -e
	case "$herramientas_complementarias" in

	1) # Zenmap
		# Instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if ! command -v zenmap &>/dev/null; then
			comprobar_instalar "Zenmap"
		fi
		#Lanza en una nueva ventana.
		gnome-terminal --title="NO CERRAR ESTA VENTANA" -- $SHELL -c "
		echo '---------------------------'
		echo '---- OdysSINT - Zenmap ----'
		echo '---------------------------'
		echo '|  NO CERRAR ESTA VENTANA.|'
		echo '|  SE SOLICITARÁ PERMISO  |'
		echo '|  ROOT                   |'
		echo '---------------------------' &&
		sudo zenmap && exit; exec $SHELL"
		echo -e ${bgreen}"Zenmap iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_complementarias
		;;
	2) # Tor Browser
		# Instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if [ ! -f "$odyssinthome/tor-browser/start-tor-browser.desktop" ]; then
			comprobar_instalar "Tor"
		fi
		# Lanza en una nueva ventana.
		gnome-terminal --title="NO CERRAR ESTA VENTANA" -- $SHELL -c "
		echo '---------------------------'
		echo '---- OdysSINT - Tor -------'
		echo '---------------------------'
		echo '|  NO CERRAR ESTA VENTANA.|'
		echo '|  ACTUALIZAR MARCADORES   |'
		echo '|  CON EXTENSIÓN:          |'
		echo '|  BookmarkHub             |'
		echo '---------------------------' &&
		cd $odyssinthome/tor-browser/ && ./start-tor-browser.desktop; exec $SHELL"
		echo -e ${bgreen}"Tor Browser iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_complementarias
		;;
	3) # Terminator
		# Instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if ! command -v terminator &>/dev/null; then
			echo -e ${byellow}"Terminator no está instalado. ¿Desea instalarlo ahora? (s/n)."${end} | tee -a >(log) 2>&1
			read -p "$(echo -e ${bred}"IMPORTANTE: Se solicitarán root si los requerimientos no están instalados: "${end})" -n 1 -r confirmacion
			echo -e
			if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
				verificar_conexion_internet
				# Para resolver un error de inicio, crea carpeta y fichero de configuración
				echo "--- COMANDO: mkdir -p $HOME/.config/terminator/" | log
				mkdir -p $HOME/.config/terminator/ 2>&1 | log
				echo "--- COMANDO: $HOME/.config/terminator/config" | log
				touch $HOME/.config/terminator/config 2>&1 | log
				mostrar_banner
				echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}${opurple}
				echo -e ${bwhite}"                                 INSTALACIÓN                                    "${end} | tee -a >(log) 2>&1
				echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}
				echo -e
				echo -e ${bpurple}"Instalando Terminator."${end} | tee -a >(log) 2>&1
				echo "--- COMANDO: sudo apt install terminator -y" | log
				sudo apt install terminator -y 2>&1 | log
			else
				mostrar_banner
				listar_herramientas_complementarias
			fi
		fi
		# Lanza en una nueva ventana y configura la torificación del terminal.
		gnome-terminal --title="NO CERRAR ESTA VENTANA" -- $SHELL -c "
		echo '--------------------------------------'
		echo '------- OdysSINT - Terminator --------'
		echo '--------------------------------------'
		echo '|  NO CERRAR ESTA VENTANA.            |' 
		echo '|  AYUDA:      terminator -h          |'
		echo '|  AYUDA:      torsocks r -h          |'
		echo '|  IP Pública: curl icanhazip.com     |'
		echo '--------------------------------------' &&
		terminator -T \"OdysSINT - TERMINATOR TORIFICADO\" -e 'bash -c \". torsocks on &&
		curl icanhazip.com; exec $SHELL\"' && exit; exec $SHELL"
		echo -e ${bgreen}"Terminator iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_complementarias
		;;
	4) # Onionshare
		# Instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if ! command -v onionshare.cli &>/dev/null; then
			comprobar_lanzar "onionshare"
		fi
		# Lanza en una nueva ventana.
		gnome-terminal --title="NO CERRAR ESTA VENTANA" -- $SHELL -c "
		echo '--------------------------------------'
		echo '------- OdysSINT - OnionShare --------'
		echo '--------------------------------------'
		echo '|  NO CERRAR ESTA VENTANA.            |' 
		echo '|  AYUDA:      onionshare.cli -h      |'
		echo '|  COMPARTIR FICHERO:                 |'
		echo '|  onionshare.cli ubicacionfichero    |'
		echo '--------------------------------------' &&
		onionshare.cli -h; exec $SHELL"
		echo -e ${bgreen}"Terminator iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_complementarias
		;;
	5) # KeePassXC
		comprobar_lanzar "KeePassXC"
		;;
	6) # Notepadqq
		comprobar_lanzar "Notepadqq"
		;;
	7) # Dia
		comprobar_lanzar "Dia"
		;;
	8) # VLC
		comprobar_lanzar "VLC"
		;;
	9) # Audacity
		comprobar_lanzar "Audacity"
		;;
	c | C) # Flameshot
		# Instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
		if ! command -v flameshot &>/dev/null; then
			comprobar_instalar "flameshot"
		fi
		# Lanza en una nueva ventana.
		gnome-terminal --title="NO CERRAR ESTA VENTANA" -- $SHELL -c "
		echo '--------------------------------------'
		echo '------- OdysSINT - Flameshot ---------'
		echo '--------------------------------------'
		echo '|  CINCO SEGUNDOS HASTA CAPTURA       |'
		echo '|  ICONO PURPURA ESQUINA SUPERIOR     |'
		echo '|  DERECHA PARA OPCIONES.             |'
		echo '|  NO CERRAR ESTA VENTANA.            |' 
		echo '--------------------------------------' &&
		sleep 5 &&
		flameshot launcher &&
		flameshot && exit; exec $SHELL"
		echo -e ${bgreen}"Flameshot iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_complementarias
		;;
	0) # Vuelve al menú principal
		mostrar_banner
		mostrar_menu_principal
		;;
	S | s) # Sale del script
		salir_del_script
		mostrar_banner
		mostrar_menu_principal
		;;
	*) # Captura las opciones inválidas
		echo -e "${bred}Opción inválida"${end} | tee -a >(log) 2>&1
		continuar
		listar_herramientas_complementarias
		;;
	esac
}

# Función para mostrar el menú de configuración de OdysSINT
function listar_configurar_odyssint() {
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}${ogreen}
	echo -e ${bwhite}"                         CONFIGURACIÓN OdysSINT                                 "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${green} "1) Actualizar sistema, instalar requerimientos y todas las herramientas OSINT"${end}
	echo -e ${bgreen} "2) Instalar o actualizar todas las herramientas complementarias"${end}
	echo -e ${green}" 3) Configurar extensiones y marcadores de perfil Ulysses en Firefox"${end}
	echo -e ${bgreen}" 4) Actualizar script desde GitHub y reinicar ejecución"${end}
	echo -e ${green} "5) Abrir log OdysSINT" ${end}
	echo -e ${bred} "6) Desinstalar todo y limpiar datos de OdysSINT" ${end}
	echo -e
	echo -e ${byellow}" 0)Volver a menú principal"${end}
	echo -e ${byellow}" s)Salir del script"${end}
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${bblack}" Selecciona una opción: "${end})" -n 1 -r configurar_odyssint
	echo -e
	case "$configurar_odyssint" in
	1) # Actualiza el sistema e instala herramientas OSINT
		mostrar_banner
		actualizar_sistema_y_requerimientos
		;;
	2) # Instala herramientas complementarias
		mostrar_banner
		instalar_herramientas_complementarias
		;;
	3) # Configura perfil Ulysses en Firefox
		mostrar_banner
		configurar_firefox
		;;
	4) # Actualiza el script a la última versión
		mostrar_banner
		actualizar_y_ejecutar_script
		;;
	5) # Abre el log de OdysSINT
		mostrar_banner
		abrir_log
		listar_configurar_odyssint
		;;
	6) # Desinstala OdysSINT
		mostrar_banner
		desinstalar_odyssint
		;;
	0) # Vuelve al menú principal
		mostrar_banner
		mostrar_menu_principal
		;;
	S | s) # Sale del script
		salir_del_script
		mostrar_banner
		mostrar_menu_principal
		;;
	*) # Captura las opciones inválidas
		echo -e "${bred}Opción inválida"${end}
		continuar
		listar_configurar_odyssint
		;;
	esac
}

# Función para instalar herramientas OSINT
function actualizar_sistema_y_requerimientos() {
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}${ogreen}
	echo -e ${bwhite}"               CONFIGURACIÓN OdysSINT > SISTEMA Y REQUERIMIENTOS                "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}
	echo -e
	# Lista los requerimientos a instalar y pide confirmación
	echo -e ${byellow}" Se va a actualizar el sistema e instalar estas aplicaciones requeridas:"${end} | tee -a >(log) 2>&1
	for app in "${requerimientos[@]}"; do
		echo -e " - ${blue}$app"${end} | tee -a >(log) 2>&1
	done
	echo -e
	echo -e ${red} "IMPORTANTE: Se solicitará permisos de root."${end}
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona (s/n) para confirmar y cualquier otra tecla para volver: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		verificar_conexion_internet
		instalar_requerimientos
		echo -e ${bpurple}"Instalando requerimientos..."${end} | tee -a >(log) 2>&1
	else
		mostrar_banner
		listar_configurar_odyssint
	fi
	# Resuelve dependencias
	echo -e ${bpurple}"Resolviendo dependencias..."${end} | tee -a >(log) 2>&1
	echo "--- COMANDO: apt --fix-broken install" | log
	sudo apt --fix-broken install -y 2>&1 | log
	# Actualiza repositorios
	echo -e ${bpurple}"Actualizando repositorios..."${end} | tee -a >(log) 2>&1
	echo "--- COMANDO: apt update" | log
	sudo apt update 2>&1 | log
	if [ $? -eq 0 ]; then
		echo -e "${bgreen}Repositorios actualizados correctamente."${end} | tee -a >(log) 2>&1
	else
		echo -e ${bred}"Error al actualizar repositorios."${end} | tee -a >(log) 2>&1
		continuar
	fi
	# Actualiza el sistema
	echo -e ${bpurple}"Actualizando sistema..."${end} | tee -a >(log) 2>&1
	echo "--- COMANDO: apt -y upgrade" | log
	sudo apt -y upgrade 2>&1 | log
	if [ $? -eq 0 ]; then
		echo -e "${bgreen}Sistema actualizado correctamente."${end} | tee -a >(log) 2>&1
	else
		echo -e ${bred}"Error al actualizar el sistema."${end} | tee -a >(log) 2>&1
		continuar
	fi
	# Instalar cada requerimiento y verificar la instalación
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
	# Pasa a instalar las herramientas OSINT
	instalar_herramientas_osint
}

# Función para instalar todas las herramientas OSINT
function instalar_herramientas_osint() {
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}${ogreen}
	echo -e ${bwhite}"               CONFIGURACIÓN OdysSINT > INSTALAR HERRAMIENTAS OSINT             "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}
	echo -e
	# Lista las herramientas OSINT a instalar y pide confirmación
	echo -e ${byellow}" Se van a instalar las siguientes aplicaciones OSINT:"${end} | tee -a >(log) 2>&1
	for app in "${aplicacionesOSINT[@]}"; do
		echo -e " - ${blue}$app"${end} | tee -a >(log) 2>&1
	done
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona (s/n) para confirmar y cualquier otra tecla para volver: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		verificar_conexion_internet
		instalar_requerimientos
		echo -e ${bpurple}"Iniciando instalación:"${end} | tee -a >(log) 2>&1
	else
		mostrar_banner
		mostrar_menu_principal
	fi
	#Instala cada herramientas OSINT
	for app in "${aplicacionesOSINT[@]}"; do
		app_lower="${app,,}"
		instalar_"$app_lower"
	done
	echo -e ${bgreen}"Instalación de herramientas OSINT completada."${end} | tee -a >(log) 2>&1
	continuar
	listar_configurar_odyssint
}

# Función para instalar las herramientas complementarias
function instalar_herramientas_complementarias() {
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}${ogreen}
	echo -e ${bwhite} "         CONFIGURACIóN OdysSINT > INSTALAR HERRAMIENTAS COMPLEMENTARIAS        "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}
	echo -e
	# Lista las aplicaciones complementarias a instalar y pide confirmación
	echo -e ${byellow}" Se va instalar las siguientes aplicaciones complementarias:"${end} | tee -a >(log) 2>&1
	echo -e ${blue}" - Zenmap"${end}
	echo -e ${blue}" - Tor Browser"${end}
	for app in "${aplicacionesComplementarias[@]}"; do
		echo -e ${blue}" - $app"${end} | tee -a >(log) 2>&1
	done
	echo -e
	echo -e ${red} " IMPORTANTE: Se va a solicitar permiso de root."${end}
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona (s/n) para confirmar y cualquier otra tecla para volver: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		verificar_conexion_internet
		instalar_requerimientos
		echo -e ${bpurple}"Iniciando instalación:"${end} | tee -a >(log) 2>&1
	else
		mostrar_banner
		listar_configurar_odyssint
	fi
	# Instala herramientas no incluidas en función por el nombre del paquete
	instalar_zenmap
	instalar_tor
	# Instala cada aplicación y verificar la instalación
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
				echo -e ${bred}"Error al instalar $app. Revisal los logs."${end} | tee -a >(log) 2>&1
				continuar
				return 1
			fi
		else
			echo -e ${bgreen}"Apliación $app ya instalada..."${end} | tee -a >(log) 2>&1
		fi
	done
	echo -e ${bgreen}"Instalación de herramientas complementarias completada."${end} | tee -a >(log) 2>&1
	continuar
	listar_configurar_odyssint
}

# Función para configurar Firefox
function configurar_firefox() {
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}${ogreen}
	echo -e ${bwhite}"               CONFIGURACIóN OdysSINT > CONFIGURAR FIREFOX                      "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${byellow}" Se va a configurar un nuevo perfil en firefox con nombre Ulysses"
	echo -e ${byellow}" que contiene las extensiones y los marcadores OdysSINT."${end} | tee -a >(log) 2>&1
	echo -e ${byellow}" Tras su instalación lanzar desde el menú principal."${end} | tee -a >(log) 2>&1
	echo -e
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona (s/n) para confirmar y cualquier otra tecla para volver: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		verificar_conexion_internet
		instalar_requerimientos
		echo -e ${bpurple}"Iniciando configuración:"${end} | tee -a >(log) 2>&1
		instalar_perfil_firefox
	else
		mostrar_banner
		listar_configurar_odyssint
	fi
	mostrar_banner
	listar_configurar_odyssint
}

# Función para actualizar el script desde el GitHub de OdysSINT y volver a ejecutarlo
function actualizar_y_ejecutar_script() {
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}${ogreen}
	echo -e ${bwhite}"               CONFIGURACIÓN OdysSINT > ACTUALIZAR SCRIPT                       "${end} | tee -a >(log) 2>&1
	echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}
	echo -e
	# Comprueba que esté instalado wget
	if ! command -v wget &>/dev/null; then
		echo -e ${byellow}"\"wget\" no está instalado. Es necesario para realizar la actualización."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}" ¿Desea instalarlo ahora? (s/n)."${end} | tee -a >(log) 2>&1
		read -p "$(echo -e ${bred}"IMPORTANTE: Se solicitarán root: "${end})" -n 1 -r confirmacion
		echo -e
		if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
			echo "--- COMANDO: apt install wget" | log
			sudo apt install wget 2>&1 | log
		else
			exit
		fi
	fi
	# Recoge el archivo desde GitHub y verificar si se pudo leer
	script_odyssint=$(curl -sSfL "$odyssint_script_url")
	if [ -z "$script_odyssint" ]; then
		# Establece el mensaje de actualizaciones dentro del banner
		declare -g script_version_update=${warning}"Repositorio OdysSINT no disponible"${end}
		echo "--- UPDATE: Repositorio OdysSINT no disponible" | log
		mostrar_banner
		return 1
	fi
	# Obtiene la versión del script desde el contenido recogido
	echo "--- COMANDO: script_version_github=$(echo "$script_odyssint" | grep '^declare script_version=' | cut -d '=' -f 2 | tr -d '"')" | log
	script_version_github=$(echo "$script_odyssint" | grep '^declare script_version=' | cut -d '=' -f 2 | tr -d '"')
	# Verifica la versión y si es menor permite la actualización
	if [[ "$script_version" == "$script_version_github" ]]; then
		echo -e ${bgreen}"Script ya actualizado a la versión $script_version_github"${end}
		echo "Script ya actualizado a la versión $script_version_github" | log
		continuar
		mostrar_banner
		listar_configurar_odyssint
	elif [[ "$script_version" < "$script_version_github" ]]; then
		echo -e ${byellow}"Se va a actualizar el script de la versión $script_version a la versión $script_version_github"${end} | tee -a >(log) 2>&1
		echo -e ${bgreen}"Para revisar los cambios visitar $odyssint_github_url"${end} | tee -a >(log) 2>&1
		echo -e ${bred}"IMPORTANTE: Tras actualizarse se reiniciará el script."${end} | tee -a >(log) 2>&1
		echo -e
		echo -e ${bgreen}"--------------------------------------------------------------------------------"${end}
		read -p "$(echo -e ${byellow}"Presiona (s/n) para confirmar y cualquier otra tecla para volver: "${end})" -n 1 -r confirmacion
		echo -e
		if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
			verificar_conexion_internet
			echo -e ${bpurple}"Actualizando script..."${end} | tee -a >(log) 2>&1
			echo "--- COMANDO: wget -O $nombre_script $odyssint_script_url" | log
			wget -O "$nombre_script" "$odyssint_script_url" 2>&1 | log
			echo "--- COMANDO: chmod +x $nombre_script" | log
			chmod +x "$nombre_script" 2>&1 | log
			echo -e ${bgreen}"Script actualizado a la versión $script_version_github, se va a reiniciar su ejecución"${end} | tee -a >(log) 2>&1
			continuar
			./"$nombre_script"
		else
			mostrar_banner
			listar_configurar_odyssint
		fi
	else
		echo -e ${bred}"ERROR: Versión de script incorrecta ($script_version)."${end} | tee -a >(log) 2>&1
		echo -e ${bred}"Versión actual de OdysSINT ($script_version_github)."${end} | tee -a >(log) 2>&1
		echo -e ${bred}"Descarga de nuevo el script del repositorio"${end} | tee -a >(log) 2>&1
		echo -e ${bred}"$odyssint_script_url"${end} | tee -a >(log) 2>&1
		continuar
		mostrar_banner
		listar_configurar_odyssint
	fi
}

# Función para eliminar las herramientas instaladas y limpiar directorio de OdysSINT
function desinstalar_odyssint() {
	echo -e ${bred}"--------------------------------------------------------------------------------"${end}${ored}
	echo -e ${bwhite}"                CONFIGURACIÓN OdysSINT > DESINSTALAR OdysSINT                   "${end} | tee -a >(log) 2>&1
	echo -e ${bred}"--------------------------------------------------------------------------------"${end}
	echo -e
	# Lista las aplicaciones requeridas a borrar y las borra tras confirmación
	echo -e ${byellow}"Las siguientes aplicaciones requeridas serán desinstaladas:"${end} | tee -a >(log) 2>&1
	for app in "${requerimientos[@]}"; do
		echo -e ${bred}" - $app"${end} | tee -a >(log) 2>&1
	done
	echo -e
	echo -e ${bred}"--------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona (s/n) para confirmar y cualquier otra tecla para continuar: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		for app in "${requerimientos[@]}"; do
			app_lower="${app,,}"
			echo "--- COMANDO: apt-get remove -y $app_lower" | log
			echo -e ${bpurple}"Desinstalando $app_lower..."${end} | tee -a >(log) 2>&1
			sudo apt-get remove -y $app_lower 2>&1 | log
		done
		echo -e ${bgreen}"Aplicaciones requeridas desinstaladas"${end} | tee -a >(log) 2>&1
	fi
	mostrar_banner
	echo -e ${bred}"--------------------------------------------------------------------------------"${end}${ored}
	echo -e ${bwhite}"                CONFIGURACIÓN OdysSINT > DESINSTALAR OdysSINT                   "${end} | tee -a >(log) 2>&1
	echo -e ${bred}"--------------------------------------------------------------------------------"${end}
	echo -e
	# Lista las aplicaciones complementarias a borrar y las borra tras confirmación
	echo -e ${byellow}"¿Eliminar las siguientes aplicaciones complementarias?  (s/n):"${end} | tee -a >(log) 2>&1
	for app in "${aplicacionesComplementarias[@]}"; do
		echo -e ${bred}" - $app"${end} | tee -a >(log) 2>&1
	done
	echo -e
	echo -e ${bred}"--------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona (s/n) para confirmar y cualquier otra tecla para continuar: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		echo -e ${bpurple}"Eliminando registro de Tor Browser..."${end} | tee -a >(log) 2>&1
		# Eliminio el registro como aplicacion de Tor-Browser
		$odyssinthome/tor-browser/start-tor-browser.desktop --unregister-app 2>&1 | log
		for app in "${aplicacionesComplementarias[@]}"; do
			app_lower="${app,,}"
			echo "--- COMANDO: apt-get remove -y $app_lower" | log
			echo -e ${bpurple}"Desinstalando $app_lower..."${end} | tee -a >(log) 2>&1
			sudo apt-get remove -y $app_lower 2>&1 | log
			echo "--- COMANDO: apt-get remove -y $app_lower" | log
		done
		echo -e ${bgreen}"Aplicaciones complementarias desinstaladas"${end} | tee -a >(log) 2>&1
	fi
	mostrar_banner
	echo -e ${bred}"--------------------------------------------------------------------------------"${end}${ored}
	echo -e ${bwhite}"                CONFIGURACIÓN OdysSINT > DESINSTALAR OdysSINT                   "${end} | tee -a >(log) 2>&1
	echo -e ${bred}"--------------------------------------------------------------------------------"${end}
	echo -e
	# Lista las aplicaciones OSINT a borrar y las borra tras confirmación junto con directorio de trabajo y perfil de Ulysses
	echo -e ${byellow}" Se va a eliminar el perfil de Firefox, la carpeta de trabajo de OdysSINT"${end} | tee -a >(log) 2>&1
	echo -e ${byellow}" y las siguientes herramientas OSINT:"${end} | tee -a >(log) 2>&1
	for app in "${aplicacionesOSINT[@]}"; do
		echo -e ${bred}" - $app"${end} | tee -a >(log) 2>&1
	done
	echo -e
	echo -e ${bred}"--------------------------------------------------------------------------------"${end}
	read -p "$(echo -e ${byellow}"Presiona (s/n) para confirmar y cualquier otra tecla para continuar: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		# Verifica la posible ubicación donde se guardan los perfiles en Firefox
		if [ -d "~/snap/firefox/common/.mozilla/firefox/"]; then
			destino="~/snap/firefox/common/.mozilla/firefox"
		else
			destino="$HOME/.mozilla/firefox"
		fi
		echo "--- COMANDO: rm -rf $destino/firefoxprofile.ulysses" | log
		rm -rf "$destino/firefoxprofile.ulysses"
		echo "--- COMANDO: mv $destino/profiles.ini_backup $destino/profiles.ini" | log
		mv "$destino/profiles.ini_backup" "$destino/profiles.ini"
		echo -e ${bpurple}"Eliminado perfil Ulysses de Firefox y recuperada configuración anterior..."${end}
		# Elimina Maltego
		echo -e ${bpurple}"Desinstalando Maltego..."${end}
		echo "--- COMANDO: sudo apt remove -y maltego" | log
		sudo apt remove -y maltego
	    echo -e ${bpurple}"Herramientas OSINT eliminadas..."${end}
		echo "--- COMANDO: sudo rm -rf /usr/share/applications/OdysSINT.desktop" | log
		#Elimina el acceso directo de OdysSINT
		sudo rm -rf "/usr/share/applications/OdysSINT.desktop" 2>&1 | log
		echo -e ${bpurple}"Acceso directo OdysSINT eliminado..."${end} | tee -a >(log) 2>&1
		#Elimina la carpeta de trabajo de OdysSINT
		rm -rf $odyssinthome
		echo -e ${bpurple}"Carpeta eliminada..."${end}
		sudo rm -rf "/usr/share/applications/OdysSINT.desktop"
		echo -e ${bpurple}"Acceso directo OdysSINT eliminado..."${end}
	else
		mostrar_banner
		listar_configurar_odyssint
	fi
	# Elimina paquetes innecesarios
	sudo apt autoremove -y
	echo -e ${bpurple}"Todos los componentes de OdysSINT eliminados..."${end}
	continuar
	exit
}

###### FUNCIONES DE INSTALACIONES #####

# Función para descargar e instalar theHarvester
function instalar_theharvester() {
	if [ ! -f "$odyssinthome/theharvester/theHarvester.py" ]; then
		echo -e ${bpurple}"Descargando theHarvester desde GitHub..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: git clone https://github.com/laramies/theHarvester.git $odyssinthome/theharvester" | log
		git clone https://github.com/laramies/theHarvester.git $odyssinthome/theharvester 2>&1 | log
		# Monta entorno virtual
		configurar_virtualenv "theharvester"
		# Instala TheHarvester
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
		# Monta entorno virtual
		configurar_virtualenv "Recon-ng"
		# Instala Recon-ng
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
		# Monta entorno virtual
		configurar_virtualenv "Spiderfoot"
		# Instala Spiderfoot
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
		# Monta entorno virtual
		configurar_virtualenv "ArchiveBox"
		mkdir -p data && cd $odyssinthome/archivebox/data # No se pasa a log para que permita configurar el usuario y contraseña inicial
		# Instala ArchiveBox
		echo -e ${bpurple}"Instalando Archivebox..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: pip3 install --upgrade archivebox yt-dlp playwright" | log
		pip3 install --upgrade archivebox yt-dlp playwright 2>&1 | log
		echo "--- COMANDO: playwright install --with-deps chromium" | log
		playwright install --with-deps chromium 2>&1 | log
		echo -e ${bpurple}"Inicializando Archivebox..."${end} | tee -a >(log) 2>&1
		echo -e ${bred}"IMPORTANTE: No olvide el usuario y contraseña"${end} | tee -a >(log) 2>&1
		echo -e ${bred}"es necesario para administrar su entorno de ArchiveBox"${end} | tee -a >(log) 2>&1
		continuar
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
		# Descarga Zotero
		mkdir -p $odyssinthome/zotero
		cd $odyssinthome/zotero
		echo -e ${bpurple}"Descargando Zotero..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: wget -O zotero.tar.bz2 https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64" | log
		wget -O zotero.tar.bz2 "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64" 2>&1 | log
		# Instala Zotero
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
		# Monta entorno virtual
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
	if [ ! -d "$odyssinthome/nexfil" ]; then
		mkdir -p $odyssinthome/nexfil/
		# Monta entorno virtual
		configurar_virtualenv "Nexfil"
		# Instalar Nexfil
		echo -e ${bpurple}"Instalando Nexfil..."${end} | tee -a >(log) 2>&1
		pip install nexfil 2>&1 | log
		# Comprueba que se ha instalado
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

# Función para descargar e instalar Geo-recon
function instalar_geo-recon() {
	if [ ! -f $odyssinthome/geo-recon/geo-recon.py ]; then
		echo -e ${bpurple}"Descargando Geo-recon desde GitHub..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: git clone https://github.com/radioactivetobi/geo-recon $odyssinthome/geo-recon" | log
		git clone https://github.com/radioactivetobi/geo-recon $odyssinthome/geo-recon 2>&1 | log
		# Monta entorno virtual
		configurar_virtualenv "Geo-recon"
		# Instalar Geo-recon
		echo -e ${bpurple}"Instalando Geo-recon..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: pip install requests" | log
		pip install requests 2>&1 | log
		echo "--- COMANDO: pip install colorama" | log
		pip install colorama 2>&1 | log
		echo "--- COMANDO: pip install namp.txt" | log
		pip install nmap.txt 2>&1 | log
		# Comprueba que se ha instalado
		if [ -f $odyssinthome/geo-recon/geo-recon.py ]; then
			echo -e ${bgreen}"Geo-recon instalado correctamente."${end} | tee -a >(log) 2>&1
		else
			echo -e ${bred}"Error al instalar Geo-recon. Verifica los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	else
		echo -e ${bgreen}"Geo-recon ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para instalar Zenmap
function instalar_zenmap() {
	if ! command -v zenmap &>/dev/null; then
		# Descarga e instala Zenmap
		echo -e ${bpurple}"Descargando Zenmap..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: wget --directory-prefix=$odyssinthome/zenmap https://nmap.org/dist/zenmap-7.94-1.noarch.rpm" | log
		wget --directory-prefix=$odyssinthome/zenmap https://nmap.org/dist/zenmap-7.94-1.noarch.rpm 2>&1 | log
		cd $odyssinthome/zenmap
		# Instalar Zenmap
		echo -e ${bpurple}"Instalando Zenmap..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: sudo alien zenmap-7.94-1.noarch.rpm" | log
		sudo alien zenmap-7.94-1.noarch.rpm 2>&1 | log
		echo "--- COMANDO: sudo dpkg --install zenmap*.deb" | log
		sudo dpkg --install zenmap*.deb 2>&1 | log
		# Comprueba que se ha instalado
		if command -v zenmap &>/dev/null; then
			echo -e ${bgreen}"Zenmap instalado correctamente."${end} | tee -a >(log) 2>&1
			echo "--- COMANDO: rm -rf zenmap*" | log
			rm -rf zenmap* 2>&1 | log
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
	if [ ! -f "$odyssinthome/tor-browser/start-tor-browser.desktop" ]; then
		# Descarga Tor Browser
		echo -e ${bpurple}"Descargando Tor Browser..."${end} | tee -a >(log) 2>&1
		# Recoge la última versión del navegador de la web de TOR y la descarga
		url_tor=$(curl -s "https://www.torproject.org/download/" | grep -oP "dist/torbrowser/[0-9.]+/tor-browser-linux-x86_64-[0-9.]+\.tar\.xz" | head -n 1 | sed 's/href="//')
		echo "--- COMANDO: wget --directory-prefix=$odyssinthome https://www.torproject.org/$url_tor" | log
		wget --directory-prefix=$odyssinthome "https://www.torproject.org/$url_tor" 2>&1 | log
		if [ -f $odyssinthome/tor-browser-linux-x86_64-*.xz ]; then
			echo -e ${bpurple}"Tor Browser descargado..."${end} | tee -a >(log) 2>&1
		else
			echo -e ${bred}"Error al descargar Tor-Browser. Revisa los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
		cd $odyssinthome
		# Extrae Tor Browser
		echo -e ${bpurple}"Extrayendo Tor Browser..."${end} | tee -a >(log) 2>&1
		echo "--- COMANDO: tar -xf tor-browser-linux-x86_64-*.xz" | log
		tar -xf tor-browser-linux-x86_64-*.xz 2>&1 | log
		cd tor-browser
		if command -v ./start-tor-browser.desktop &>/dev/null; then
			# Registra Tor-Browser como aplicación
			echo "--- COMANDO: ./start-tor-browser.desktop --register-app" | log
			./start-tor-browser.desktop --register-app 2>&1 | log
			echo -e ${bgreen}"Tor Browser instalado correctamente."${end} | tee -a >(log) 2>&1
			echo "--- COMANDO: rm -rf $odyssinthome/tor-browser-linux-*" | log
			# Insta perfil Ulysses.
			destino="$odyssinthome/tor-browser/Browser/TorBrowser/Data/Browser/"
			# Verifica si el archivo ya está descargado
			if [ ! -f "$odyssinthome/firefoxprofile.ulysses.zip" ]; then
				# Si el archivo no está presente, intenta descargarlo
				echo -e "${bpurple}Descargando el perfil Firefox desde el repositorio de OdysSINT...${end}" | tee -a >(log) 2>&1
				echo "--- COMANDO: wget -q --show-progress -O $odyssinthome/firefoxprofile.ulysses.zip $odyssint_firefox_url" | log
				if ! wget -q --show-progress -O "$odyssinthome/firefoxprofile.ulysses.zip" "$odyssint_firefox_url" 2>&1 | log; then
					echo -e "${bred}No se pudo descargar el archivo. Verifica la conexión a internet.${end}" | tee -a >(log) 2>&1
					continuar
					return 1
				fi
			fi
			# Extrae el archivo .zip sobrescribiendo la carpeta si existe
			echo -e "${bpurple}Extrayendo el archivo...${end}" | tee -a >(log) 2>&1
			echo "--- COMANDO: unzip -o $odyssinthome/firefoxprofile.ulysses.zip -d $destino/firefoxprofile.ulysses" | log
			if unzip -o "$odyssinthome/firefoxprofile.ulysses.zip" -d "$destino/firefoxprofile.ulysses" 2>&1 | log; then
				echo -e "${bgreen}Extracción completa.${end}" | tee -a >(log) 2>&1
			else
				echo -e "${bred}Error al extraer el archivo.${end}" | tee -a >(log) 2>&1
				continuar
				return 1
			fi
			# Crea el fichero profiles.ini
			nuevo_perfil="[Profile0]\nName=default\nIsRelative=1\nPath=firefoxprofile.ulysses\nDefault=1\n\n[General]\nStartWithLastProfile=1\nVersion=2\n"
			rm -rf $destino/profiles.ini
			echo -e "$nuevo_perfil" >"$destino/profiles.ini"
			echo -e "${bgreen}Perfil Ulysses agregado a Tor.${end}" | tee -a >(log) 2>&1
			echo "--- COMANDO: rm -rf $odyssinthome/tor-browser-linux*" | log
			rm -rf $odyssinthome/tor-browser-linux-x86_64-*.xz 2>&1 | log
			return
		else
			echo -e ${bred}"Error al instalar Tor Browser. Verifica los logs."${end} | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	else
		echo -e ${bgreen}"Tor Browser ya está instalado."${end} | tee -a >(log) 2>&1
	fi
}

# Función para crear nuevo perfil en Firefox con extensiones y marcadores.
function instalar_perfil_firefox() {
	# Verifica si Firefox está instalado
	if ! command -v firefox &>/dev/null; then
		instalar_requerimientos
	fi
	# Verifica la posible ubicación donde se guardan los perfiles en Firefox
	if [ -d "$HOME/snap/firefox/common/.mozilla/firefox/" ]; then
		destino="$HOME/snap/firefox/common/.mozilla/firefox/" # Ubuntu
	else
		destino="$HOME/.mozilla/firefox/" # Debian
	fi
	# Verifica si el archivo ya está descargado
	if [ ! -f "$odyssinthome/firefoxprofile.ulysses.zip" ]; then
		# Si el archivo no está presente, intenta descargarlo
		echo -e "${bpurple}Descargando el perfil Firefox desde el repositorio de OdysSINT...${end}" | tee -a >(log) 2>&1
		echo "--- COMANDO: wget -q --show-progress -O $odyssinthome/firefoxprofile.ulysses.zip $odyssint_firefox_url" | log
		if ! wget -q --show-progress -O "$odyssinthome/firefoxprofile.ulysses.zip" "$odyssint_firefox_url" 2>&1 | log; then
			echo -e "${bred}No se pudo descargar el archivo. Verifica la conexión a internet.${end}" | tee -a >(log) 2>&1
			continuar
			return 1
		fi
	fi
	# Verifica si el perfil ya está instalado
	if [[ -d "$HOME/snap/firefox/common/.mozilla/firefox/firefoxprofile.ulysses" || -d "$HOME/.mozilla/firefox/firefoxprofile.ulysses" ]]; then
		read -p "$(echo -e ${byellow}"Perfil de Firefox ya instalado, ¿sobreescribir? (s/n): "${end})" -n 1 -r confirmacion
		echo -e
		if [[ $confirmacion != "S" && $confirmacion != "s" ]]; then
			continuar
			return
		fi
	fi
	# Extrae el archivo tar.xz sobrescribiendo la carpeta si existe
	echo -e "${bpurple}Extrayendo el archivo...${end}" | tee -a >(log) 2>&1
	echo "--- COMANDO: unzip -o $odyssinthome/firefoxprofile.ulysses.zip -d $destino/firefoxprofile.ulysses" | log
	if unzip -o "$odyssinthome/firefoxprofile.ulysses.zip" -d "$destino/firefoxprofile.ulysses" 2>&1 | log; then
		echo -e "${bgreen}Extracción completa.${end}" | tee -a >(log) 2>&1
	else
		echo -e "${bred}Error al extraer el archivo.${end}" | tee -a >(log) 2>&1
		continuar
		return 1
	fi
	# Realiza un backup del archivo profiles.ini
	echo "--- COMANDO: cp $destino/profiles.ini $destino/profiles.ini_backup" | log
	if cp "$destino/profiles.ini" "$destino/profiles.ini_backup" | tee -a >(log) 2>&1; then
		echo -e "${bgreen}Perfil de Firefox agregado.${end}" | tee -a >(log) 2>&1
	else
		echo -e "${bred}Error al realizar el backup.${end}" | tee -a >(log) 2>&1
	fi
	echo -e "${bgreen}Backup profiles.ini realizado.${end}" | tee -a >(log) 2>&1
	nuevo_perfil="[Profile0]\nName=Ulysses\nIsRelative=1\nPath=firefoxprofile.ulysses\nDefault=1\n\n[General]\nStartWithLastProfile=1\nVersion=2\n"
	echo -e "$nuevo_perfil" >"$destino/profiles.ini"
	echo -e "${bpurple}Firefox se ha configurado correctamente.${end}" | tee -a >(log) 2>&1
	continuar
}

# Función para comprobar e instalar requerimientos si no están instalados
function instalar_requerimientos() {
	mostrar_banner
	echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}${opurple}
	echo -e ${bwhite}"                                 INSTALACIÓN                                    "${end} | tee -a >(log) 2>&1
	echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}
	echo -e
	echo -e "${bpurple}Comprobando requerimientos, esto puede tardar..."${end} | tee -a >(log) 2>&1
	for app in "${requerimientos[@]}"; do
		if ! command -v "$app" &>/dev/null; then
			echo "--- COMANDO: sudo apt-get install -y $app" | log
			sudo apt-get install -y "$app" 2>&1 | log
		fi
	done
}

# Función para configurar Virtual Enviroment de Python
function configurar_virtualenv() {
	local herramienta="${1,,}"
	echo -e ${bpurple}"Montando entorno virtual..."${end} | tee -a >(log) 2>&1
	echo "--- COMANDO: virtualenv -p /usr/bin/python3 $odyssinthome/$herramienta/venv" | log
	virtualenv -p /usr/bin/python3 $odyssinthome/$herramienta/venv 2>&1 | log
	# Comprueba en que ubicación ha montado el entorno virtual 
	if [ -d "$odyssinthome/$herramienta/venv/local" ]; then
		venv_path=/local # Debian, si no Ubuntu
	fi
	echo "--- COMANDO: source $odyssinthome/$herramienta/venv/bin/activate" | log
	source $odyssinthome/$herramienta/venv"$venv_path"/bin/activate #No se pasa a log porque si no falla
	# Cambia al directorio de la herramienta
	echo "--- COMANDO: cd $odyssinthome/$herramienta" | log
	cd $odyssinthome/$herramienta
}

#Función para comprobar donde se ha instalado la activación del entorno virtual de Python. Compatibilidad con Debian
function comprobar_virtualenv() {
	local herramienta="${1,,}"
	# Compruebo en que ubicación ha montado el entorno virtual
	if [ -d "$odyssinthome/$herramienta/venv/local" ]; then
		venv_path=/local # Debian, si no Ubuntu
	fi
	echo "--- COMANDO: cd $odyssinthome/$herramienta" | log
	cd $odyssinthome/$herramienta/venv"$venv_path"/bin
}

# Funcion que lanza una apliación
function comprobar_lanzar() {
	local herramienta="${1//_/ }"
	local herramienta_min="${1,,}"
	# Instala la herramienta si no está presente, verifica la conexión a internet, requerimientos y comprueba la correcta instalación.
	if ! command -v $herramienta_min &>/dev/null; then
		echo -e ${byellow}"Herramienta $herramienta no está instalado. ¿Desea instalarlo ahora? (s/n)."${end} | tee -a >(log) 2>&1
		read -p "$(echo -e ${bred}"IMPORTANTE: Se solicitarán root si los requerimientos no están instalados: "${end})" -n 1 -r confirmacion
		echo -e
		if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
			verificar_conexion_internet
			mostrar_banner
			echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}${opurple}
			echo -e ${bwhite}"                                 INSTALACIÓN                                    "${end} | tee -a >(log) 2>&1
			echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}
			echo -e
			echo -e ${bpurple}"Instalando $herramienta."${end} | tee -a >(log) 2>&1
			echo "--- COMANDO: apt install $herramienta_min" | log
			sudo apt install $herramienta_min -y 2>&1 | log
		else
			mostrar_banner
			listar_herramientas_complementarias
		fi
	fi
	# Lanza en una nueva ventana.
	gnome-terminal --title="NO CERRAR ESTA VENTANA" -- $SHELL -c "
	echo '----------------------------'
	echo '-- OdysSINT - $herramienta ---'
	echo '----------------------------'
	echo '|  NO CERRAR ESTA VENTANA. |'
	echo '----------------------------' &&
	$herramienta_min && exit; exec $SHELL"
	echo -e ${bgreen}"$herramienta iniciado en una nueva ventana."${end} | tee -a >(log) 2>&1
	continuar
	listar_herramientas_complementarias
}

# Funcion que comprueba e instala una herramienta pasada
function comprobar_instalar() {
	local herramienta="${1//_/ }"
	local herramienta_min="${1,,}"
	echo -e ${byellow}"$herramienta no está instalado. ¿Desea instalarlo ahora? (s/n)."${end} | tee -a >(log) 2>&1
	read -p "$(echo -e ${bred}"IMPORTANTE: Se solicitarán root si los requerimientos no están instalados: "${end})" -n 1 -r confirmacion
	echo -e
	if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		verificar_conexion_internet
		instalar_requerimientos
		instalar_"$herramienta_min"
		if [ $? -eq 1 ]; then
			mostrar_banner
			mostrar_menu_principal
		fi
	else
		mostrar_banner
		mostrar_menu_principal
	fi
	return
}

###### FUNCIONES VARIAS ######

# Comprueba si la carpeta $odyssinthome existe, si no la crea
function comprobar_directorio() {
	if [ ! -d "$odyssinthome" ]; then
		mkdir -p $odyssinthome
	# Comprueba si la carpeta log existe, necesario cuando clonamos el repositorio ya que esta carpeta no está
	fi
	if [ ! -d "$odyssinthome/logs/" ]; then
		mostrar_banner
		mkdir -p $odyssinthome/logs/
		acceso_directo="[Desktop Entry]\nType=Application\nName=OdysSINT\nExec=gnome-terminal --working-directory=$HOME/OdysSINT --title=\"Script OdysSINT\" --geometry=80x80 -- /bin/bash -c \"$odyssinthome/OdysSINT.sh\"\nTerminal=true\nIcon=$odyssinthome/Ulysses_Icon.png"
		echo -e "$acceso_directo" > $odyssinthome/OdysSINT.desktop
		echo -e ${bgreen}"Se ha creado el directorio de trabajo en $odyssinthome."${end} | tee -a >(log) 2>&1
		# Solicita confirmación para crear acceso directo del script en listado de aplicaciones
		echo -e ${byellow}"¿Crear acceso directo del script dentro de las aplicaciones del entorno? (s/n)"${end}
		read -p "$(echo -e ${bred}"IMPORTANTE: Se solicitarán permisos root: "${end})" -n 1 -r confirmacion
		echo -e
		if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
		sudo cp "$odyssinthome/OdysSINT.desktop" "/usr/share/applications/OdysSINT.desktop"
			echo -e ${bgreen}"Acceso directo creado, asegurate de poner el script de OdysSINT y el icono"${end} | tee -a >(log) 2>&1
			echo -e ${bgreen}"\"Ulysses_Icon.png\" del repositorio en la carpeta $odyssinthome"${end} | tee -a >(log) 2>&1
			continuar
		fi
	fi
	# Imprime un primer mensaje en log con inicio y versión de script.
	echo "--- INICIO EJECUCIÓN SCRIPT - VERSIÓN ACTUAL OdysSINT $script_version -----" | log
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
	echo -e ${byellow}"¿Estás seguro de que quieres salir del script? Presiona (s/n) para confirmar."${end}
	read -n1 -s tecla
	if [[ $tecla == "S" || $tecla == "s" ]]; then
		echo -e "${bgreen}¡${bred}H${bblue}a${byellow}s${bpurple}t${bcyan}a ${bblack}p${bgreen}r${bred}o${bblue}n${byellow}t${bpurple}o${bcyan}!"${end}
		exit
	fi
	mostrar_banner
	mostrar_menu_principal
}

# Función que permite pulsar ctrl+c en cualquier momento.
function ctrl_c() {
	echo
	salir_del_script
	tput cnorm
	exit 0
}

# Función que para y pide continuar
function continuar() {
	echo -e ${warning}${byellow}"Pulsa cualquier tecla para continuar"${end}
	read -n 1 -r
	mostrar_banner
}

# Función para comprobar si el script está actualizado
function comprobar_version() {
	# Instala curl si no está disponible
	if ! command -v curl &>/dev/null; then
		echo -e ${byellow}"\"curl\" no está instalado. Es necesario para comprobar actualizaciones."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}" ¿Desea instalarlo ahora? (s/n)."${end} | tee -a >(log) 2>&1
		read -p "$(echo -e ${bred}"IMPORTANTE: Se solicitarán root: "${end})" -n 1 -r confirmacion
		echo -e
		if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
			echo "--- COMANDO: apt install curl" | log
			sudo apt install curl 2>&1 | log
		else
			return
		fi
	fi
	# Recoge el archivo desde GitHub y verificar si se pudo leer
	script_odyssint=$(curl -sSfL "$odyssint_script_url")
	if [ -z "$script_odyssint" ]; then
		# Mensaje del banner para las actualizaciones
		declare -g script_version_update=${warning}"Repositorio OdysSINT no disponible"${end}
		echo "--- UPDATE: Repositorio OdysSINT no disponible" | log
		mostrar_banner
		return 1
	fi
	# Recoge la versión del script desde el contenido obtenido
	script_version_github=$(echo "$script_odyssint" | grep '^declare script_version=' | cut -d '=' -f 2 | tr -d '"')
	echo "--- VERSIÓN SCRIPT GITHUB:$script_version_github" | log
	# Verificar si se encontró la versión del script
	if [ -z "$script_version" ]; then
		# Mensaje del banner para las actualizaciones
		declare -g script_version_update=${warning}"Error script repositorio"${end}
		echo "--- UPDATE: Error script repositorio" | log
		mostrar_banner
		return 1
	fi
	# Verifica si las versiones son iguales.
	if [[ "$script_version" == "$script_version_github" ]]; then
		# Mensaje del banner para las actualizaciones
        declare -g script_version_update=""${bgreen}"Script en última versión"${end}
		echo "--- UPDATE: Script en última versión" | log
		mostrar_banner
	# Si es menor hay actualizaciones.
	elif [[ "$script_version" < "$script_version_github" ]]; then
		# Mensaje del banner para las actualizaciones
		declare -g script_version_update=${bgreen}"Actualización $script_version_github disponible"${end}
		echo "--- UPDATE: Actualización $script_version_github disponible" | log
		mostrar_banner
		echo -e ${bgreen}"Disponible actualización ($script_version_github) de OdysSINT."${end} | tee -a >(log) 2>&1
		echo -e ${bgreen}"Actualiza script desde el menú de configuración."${end}
		continuar
	else
		# Mensaje del banner para las actualizaciones
		declare -g script_version_update=${warning}"Versión de script incorrecta"${end}
		echo "--- UPDATE: Versión de script incorrecta" | log
		mostrar_banner
		echo -e ${bred}"ERROR: Versión de script incorrecta ($script_version)."${end} | tee -a >(log) 2>&1
		echo -e ${bred}"Versión actual de OdysSINT ($script_version_github)."${end} | tee -a >(log) 2>&1
		echo -e ${bred}"Descarga de nuevo el script del repositorio"${end}
		echo -e ${bred}"$odyssint_script_url"${end}
		continuar
	fi
}

# Función para comprobar si somos ROOT, si es así nos saca del script
function verificar_root() {
	if [ "$(id -u)" == "0" ]; then
		mostrar_banner
		echo -e ${bred}"Para un correcto uso no ejecutar con permisos de root."${end} | tee -a >(log) 2>&1
		echo -e ${bred}"El script solicitará elevar privilegios cuando sea necesario."${end} | tee -a >(log) 2>&1
		continuar
		clear
		exit 1
	fi
}

# Función para verificar la conexión a Internet
function verificar_conexion_internet() {
	echo
	echo "--- COMANDO: ping -q -c 1 -W 1 8.8.8.8" | log
	if ! ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
		echo -e ${bred}"No hay conexión a Internet. "${end}
		echo -e ${bred}"Por favor, verifique su conexión y vuelva a intentarlo."${end}
		continuar
		# Mensaje del banner
		declare -g script_version_update=${warning}"Comprobar conexión Internet"${end}
		echo "--- UPDATE: Comprobar conexión Internet" | log
		mostrar_banner
		mostrar_menu_principal
	else
		echo "--- UPDATE: CONEXIÓN A INTERNET" | log
		comprobar_version
	fi
}

# Función para abrir el fichero de log actual
function abrir_log() {
	gnome-terminal --geometry=120x40 --title="Log OdysSINT - $(date +'%Y-%m-%d')" -- $SHELL -c "tail -f $logfile; exec $SHELL"
	echo -e ${bgreen}"Log abierto en una nueva ventana."${end} | tee -a >(log) 2>&1
	continuar
}

###### INICIO SCRIPT ######

# Opciones de valores pasados al script

case $1 in
-h) # Muestra la ayuda
	verificar_root
	comprobar_directorio
	mostrar_ayuda
	;;
-i) # Instalación desatendida de herramientas OSINT
	verificar_root
	comprobar_directorio
	verificar_conexion_internet
	instalar_requerimientos
	echo -e ${bpurple}"Iniciando instalación desatendida de herramientas OSINT."${end} | tee -a >(log) 2>&1
	for app in "${aplicacionesOSINT[@]}"; do
		app_lower="${app,,}"
		instalar_"$app_lower"
	done
	echo -e ${bgreen}"Herramientas OSINT instaladas."${end} | tee -a >(log) 2>&1
	;;
-e) # Instalación desatendida del perfil Ulysses en Firefox
	verificar_root
	comprobar_directorio
	verificar_conexion_internet
	echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}${opurple}
	echo -e ${bwhite}"                                 INSTALACIÓN                                    "${end} | tee -a >(log) 2>&1
	echo -e ${bpurple}"--------------------------------------------------------------------------------"${end}
	echo -e
	echo -e ${bpurple}"Iniciando instalación desatendida de perfil Ulysses para Firefox."${end} | tee -a >(log) 2>&1
	instalar_perfil_firefox
	echo -e ${bgreen}"Perfil Ulysses en Firefox instalado."${end} | tee -a >(log) 2>&1
	;;
-c) # Instalación desatendida de herramientas complementarias
	verificar_root
	comprobar_directorio
	verificar_conexion_internet
	instalar_requerimientos
	echo -e ${bpurple}"Iniciando instalación desatendida de herramientas complementarias."${end} | tee -a >(log) 2>&1
	for app in "${aplicacionesComplementarias[@]}"; do
		app_lower="${app,,}"
		if ! command -v $app_lower &>/dev/null; then
			echo -e ${bpurple}"Instalando $app..."${end}
			echo "--- COMANDO: apt-get install -y $app_lower" | log
			sudo apt-get install -y $app_lower 2>&1 | log
			if [ $? -eq 0 ]; then
				echo -e "${bgreen}$app instalado correctamente."${end}
			else
				echo -e ${bred}"Error al instalar $app"
				return 1
			fi
		else
			echo -e ${bgreen}"Apliación $app ya instalada..."${end}
		fi
	done
	instalar_zenmap
	instalar_tor
	echo -e ${bgreen}"Aplicaciones complementarias instaladas."${end} | tee -a >(log) 2>&1
	;;
-a) # Actualización desatendida de script
	verificar_root
	comprobar_directorio
	echo -e ${bpurple}"Actualizando script..."${end} | tee -a >(log) 2>&1
	if ! command -v wget &>/dev/null; then
		echo -e ${byellow}"\"wget\" no está instalado. Es necesario para realizar la actualización."${end} | tee -a >(log) 2>&1
		echo -e ${byellow}" ¿Desea instalarlo ahora? (s/n)."${end} | tee -a >(log) 2>&1
		read -p "$(echo -e ${bred}"IMPORTANTE: Se solicitarán root: "${end})" -n 1 -r confirmacion
		echo -e
		if [[ $confirmacion == "S" || $confirmacion == "s" ]]; then
			echo "--- COMANDO: apt install wget" | log
			sudo apt install wget 2>&1 | log
		else
			exit
		fi
	fi
	echo "--- COMANDO: wget -O $nombre_script $odyssint_script_url" | log
	wget -O "$nombre_script" "$odyssint_script_url" 2>&1 | log
	echo "--- COMANDO: chmod +x $nombre_script" | log
	chmod +x "$nombre_script" 2>&1 | log
	echo -e ${bgreen}"Script actualizado a la última versión"${end} | tee -a >(log) 2>&1
	;;
-l) # Mostrar el log
	verificar_root
	comprobar_directorio
	gnome-terminal --geometry=120x40 --title="Log OdysSINT - $(date +'%Y-%m-%d')" -- $SHELL -c "tail -f $logfile; exec $SHELL"
	echo -e ${bgreen}"Log abierto en una nueva ventana."${end} | tee -a >(log) 2>&1
	;;
-d) # Desisntalar OdysSINT
	verificar_root
	comprobar_directorio
	mostrar_banner
	echo -e ${bred}"--------------------------------------------------------------------------------"${end}${ored}
	echo -e ${bwhite}"                                 DESINSTALANDO                                 "${end} | tee -a >(log) 2>&1
	echo -e ${bred}"--------------------------------------------------------------------------------"${end}
	echo -e
	# Elimina todo sin confirmación
	echo -e ${bpurple}"Iniciando desisntalación desatendida de herramientas OdysSINT."${end} | tee -a >(log) 2>&1
	# Elimina las aplicaciones requeridas
	for app in "${requerimientos[@]}"; do
		app_lower="${app,,}"
		echo "--- COMANDO: apt-get remove -y $app_lower" | log
		echo -e ${bpurple}"Desinstalando $app_lower..."${end} | tee -a >(log) 2>&1
		sudo apt-get remove -y $app_lower 2>&1 | log
	done
	echo -e ${bgreen}"Aplicaciones requeridas desinstaladas"${end} | tee -a >(log) 2>&1
	# Eliminio el registro como aplicacion de Tor-Browser
	$odyssinthome/tor-browser/start-tor-browser.desktop --unregister-app 2>&1 | log
	for app in "${aplicacionesComplementarias[@]}"; do
		app_lower="${app,,}"
		echo "--- COMANDO: apt remove -y $app_lower" | log
		echo -e ${bpurple}"Desinstalando $app_lower.."${end} | tee -a >(log) 2>&1
		sudo apt-get remove -y $app_lower 2>&1 | log
	done
	# Elimina las aplicaciones complementarias
	echo -e ${bgreen}"Aplicaciones complementarias desinstaladas."${end} | tee -a >(log) 2>&1
	if [ -d "~/snap/firefox/common/.mozilla/firefox/" ]; then
		destino="~/snap/firefox/common/.mozilla/firefox"
	else
		destino="$HOME/.mozilla/firefox"
	fi
	# Elimina el perfil de Ulysses y restaura la configuración anterior
	echo "--- COMANDO: rm -rf $destino/firefoxprofile.ulysses" | log
	rm -rf "$destino/firefoxprofile.ulysses" 2>&1 | log
	echo "--- COMANDO: mv $destino/profiles.ini_backup $destino/profiles.ini" | log
	mv "$destino/profiles.ini_backup" "$destino/profiles.ini" 2>&1 | log
	echo -e ${bpurple}"Eliminado perfil Ulysses de Firefox y recuperada configuración anterior..."${end} | tee -a >(log) 2>&1
	# Elimina Maltego
	echo -e ${bpurple}"Desinstalando Maltego..."${end} | tee -a >(log) 2>&1
	echo "--- COMANDO: sudo apt remove -y maltego" | log
	sudo apt remove -y maltego 2>&1 | log
	echo -e ${bpurple}"Herramientas OSINT eliminadas..."${end} | tee -a >(log) 2>&1
	echo "--- COMANDO: sudo rm -rf /usr/share/applications/OdysSINT.desktop" | log
	#Elimina el acceso directo de OdysSINT
	sudo rm -rf "/usr/share/applications/OdysSINT.desktop" 2>&1 | log
	echo -e ${bpurple}"Acceso directo OdysSINT eliminado..."${end} | tee -a >(log) 2>&1
	#Elimina la carpeta de trabajo de OdysSINT
	rm -rf $odyssinthome
	echo -e ${bpurple}"Carpeta eliminada..."${end}
	sudo apt autoremove -y
	echo -e ${bgreen}"OdysSINT desinstalado."${end}
	;;
"")	# Inicio sin valores
	trap ctrl_c INT
	# Comprueba si somos root
	verificar_root
	# Comprueba que el directorio de trabajo existe
	comprobar_directorio
	# Comprueba internet y la versión del script
	verificar_conexion_internet
	# Muestra el menú principal
	mostrar_banner
	mostrar_menu_principal
	;;
*)  # Muestra ayuda para valor desconocido
	comprobar_directorio
	echo -e ${bred}"Opción $1 no reconocida. Usar -h para ayuda"${end} | tee -a >(log) 2>&1
	;;
esac
