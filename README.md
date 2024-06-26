# OdysSINT [![version-1.0](https://img.shields.io/badge/version-1.0-green)](https://github.com/javi-ag/OdysSINT/releases/tag/pre-release) [![CC0-1.0.1](https://img.shields.io/badge/license-cc0-blue)](https://github.com/javi-ag/OdysSINT/tree/main?tab=CC0-1.0-1-ov-file#) [![Shell](https://img.shields.io/badge/language-shell-red)](https://img.shields.io/badge/language-shell-red)
![1200px-WATERHOUSE_-_Ulises_y_las_Sirenas_(National_Gallery_of_Victoria,_Melbourne,_1891 _Óleo_sobre_lienzo,_100 6_x_202_cm)](https://github.com/javi-ag/OdysSINT/assets/153739397/b28f54ea-95cf-4b0f-a452-8afa41628b55)
<sup>_Ulises y las Sirenas, John William Waterhouse (National Gallery de Victoria, Melbourne)_</sup>


## :sailboat: ¿Qué es OdysSINT? 
**OdysSINT** es un script de instalación y uso de herramientas OSINT en bash para entornos basados en Debian que junto a una serie de procedimientos tienen como objetivo ayudar en la preparación de un entorno adecuado para la realización de investigaciones. Su nombre proviene del juego de palabras Odyssey + OSINT, esta unión surge de la necesidad de reflejar, como en la epopeya de Homero, la dificultad de la exploración en las vastas aguas de información en fuentes abiertas a las que tenemos acceso hoy en día para poder alcanzar nuestro objetivo en una investigación. La solución además dispone de un perfil de Firefox denominado **Ulysses** con un conjunto de marcadores, extensiones y configuraciones especiales que permite ser configurado también, en otros navegadores compatibles con Firefox e incluso en sistemas como Windows.

## :white_check_mark: Caracteristicas OdysSINT  
- Completo listado de herramientas OSINT, aplicaciones complementarias, extensiones y marcadores.
- Herramientas compatibles con cualquier distribución con base Debian.
- Script con menú intuitivo y de uso sencillo.
- Instalación componente a componente o de toda la solución
- Uso del script en modo desatendido a través de argumentos.
- Notificación de nuevas versiones y posibilidad de actualizar desde el propio script.
- Marcadores y extensiones compatibles con cualquier sistema operativo que disponga de Firefox versión mayor de la 118.
- Descripción intuitiva de cada elemento.

 > [!CAUTION]
 > Se recomienda el uso de una solución VPN para la realización de cualquier investigación. En este proyecto no se incluye ninguna opción debido a que si se quiere disponer una solución VPN que proporcione un buen servicio y calidad es necesario un pago con suscripción.

## :diving_mask: Herramientas OSINT
Herramientas OSINT instaladas por script:
* [theHarvester:](https://github.com/laramies/theHarvester) obtiene emails, IPs y subdominios de diferentes fuentes online (CLI).
* [Recon-ng:](https://github.com/lanmaster53/recon-ng) framework de automatización para tareas de OSINT. Permite ejecutar diferentes módulos para recopilar información de forma eficiente (CLI\Web).
* [Spiderfoot:](https://github.com/lanmaster53/recon-ng) automatiza la recolección de información sobre activos en línea desde múltiples fuentes, identificando riesgos e inteligencia (Web).
* [NExfil:](https://github.com/thewhiteh4t/nexfil) encuentra nombres de usuarios en más de 300 webs en pocos segundos (CLI).
* [Photon:](https://github.com/s0md3v/Photon) rastrea rápidamente webs y recopilar información como URLs, archivos y metadatos (CLI).
* [Geo-recon:](https://github.com/radioactivetobi/geo-recon/tree/master) geolocalización de IPs a través de diferentes bases de datos públicas (CLI).
* [Maltego:](https://www.maltego.com/) extrae y analiza datos de múltiples fuentes mediante transformadas representándolos de forma visual y permitiendo encontrar relaciones y patrones (App).
* [ArchiveBox:](https://github.com/ArchiveBox/ArchiveBox) archivado local de páginas webs para su visualización offline (Web\Add-on).
* [Zotero:](https://www.zotero.org) gestor de referencias para la organización en las investigaciones (App\Add-on).

![2024-03-22_14 49 25_x_vmware](https://github.com/javi-ag/OdysSINT/assets/153739397/1a00b96b-e8c2-43f8-9556-baedda32f6a2)
<sup>_Lanzamiento de theHarvester con script OdysSINT en OVA Ubuntu_</sup>

## :anchor:	Herramientas Complementarias
Herramientas adicionales instaladas también con el script:
* [Zenamp:](https://nmap.org/zenmap) interfaz gráfica de Nmap, escanea redes y descubre vulnerabilidades (App).
* [Tor Browser:](https://www.torproject.org) para navegar anónimamente, con el perfil Ulysses por la red Tor (App).
* [Terminator:](https://gnome-terminator.org) gestor de terminales Torificado por Torsocks (CLI).
* [OnionShare:](https://onionshare.org) comparte archivos de forma segura y anónima mediante la red Tor (CLI).
* [KeePassXC:](https://keepassxc.org) almacena datos y contraseñas de forma segura (APP).
* [Notepadqq:](https://notepadqq.com) potente editor de texto parecido a Notepad++ (APP).
* [Dia:](http://live.gnome.org/Dia) editor de diagramas ideal para generar relaciones en investigaciones (App).
* [VLC:](http://www.videolan.org) visualizador y conversor de videos (App).
* [Audacity:](https://www.audacityteam.org) escucha y edita audios (App).
* [Flameshot:](https://flameshot.org) realiza capturas de pantalla y las edita de forma simple (App).

![2024-03-24_04 57 00_x_vmware](https://github.com/javi-ag/OdysSINT/assets/153739397/94858814-42ed-41ec-9530-36685b74e9d6)
<sup>_Apertura de Terminator tolificado por Torsocks en OVA Debian_</sup>

## :globe_with_meridians: Marcadores 
Los marcadores pueden ser actualizados siempre con la extensión [BookmarkHub](https://github.com/javi-ag/OdysSINT/blob/main/README.md#solo-marcadores-ulysses) y están agrupados en las siguientes carpetas:
- **OdysSINT:** URLs relacionadas con el proyecto.
- **ANÁLISIS DOMINIO / URL:** enlaces para análisis de dominios y su contenido.
- **ANÁLISIS INMÁGENES:** herramientas para el estudio de imágenes.
- **ANÁLISIS IP /DNS:** marcadores para análisis de servicios y vulnerabilidades de IPs.
- **ARCHIVADO:** direcciones para captura de sitios webs.
- **BUSCADORES:** enlaces de principales buscadores y herramientas relacionadas.
- **CORREO:** herramientas relacionadas con el uso y análisis de emails.
- **HERRAMIENTAS:** enlaces varios relacionados con OSINT.
- **HERRAMIENTAS LOCALES:** direcciones relacionadas con las herramientas OSINT instaladas con el script.
- **IDENTIDAD:** URLs para identificar o generar perfiles de personas.
- **MAPAS & GEOLOCALIZACIÓN:** marcadores relacionados con mapas y ubicaciones de objetivos.
- **RRSS:** enlaces para análisis de redes sociales.
- **SEGUIMIENTO:** herramientas para monitorización y seguimiento de objetivos. 
- **TELÉFONO / SMS:** marcadores relacionados con la comunicación.

El listado completo de marcadores se puede encontrar en [listado-elementos.xlsx.](https://github.com/javi-ag/OdysSINT/blob/main/listado-elementos.xlsx)
 
## :jigsaw: Extensiones
Las extensiones están recogidas en el enlace de [addons de Ulysses](https://addons.mozilla.org/es/firefox/collections/18254528/OdysSINT):
 * [ArchiveBox Exporter:](https://github.com/ArchiveBox/archivebox-browser-extension) extensión ligada a la herramienta ArchiveBox, agiliza la captura de direcciones añadiendo automatismos.
 * [BookmarkHub:](https://github.com/dudor/BookmarkHub) permite la instalación y actualización de los marcadores seleccionados en la solución sin necesidad de instalar el perfil Ulysses, para ello seguir los pasos del apartado de la extensión dentro de la URL de addons de Ulysses, compatible con Chrome, Firefox Edge, Opera y cualquier navegador basado en Chromium.
 * [Distill Web Monitor:](https://distill.io) permite configurar monitorizaciones en cambios de partes o webs completas.
 * [DuckDuckGo Privacy Essentials:](https://duckduckgo.com/app) elimina cookies de rastreo, añade privacidad a las búsquedas con bloqueadores de enlaces de rastreo, cifrado automático, protección de email, bloqueo de cookies de rastreo, de huella digital y activa GPC.
 * [Flagfox:](https://flagfox.wordpress.com) muestra la bandera del país correspondiente a la ubicación de la página web que se está visitando y ofrece numerosas herramientas.
 * [Privacy Badger](https://privacybadger.org) potente bloqueador que aprende a encontrar rastreadores invisibles con relación al comportamiento y no en base a una lista de bloqueo.
 * [Search by Image:](https://github.com/dessant/search-by-image#readme) busca una imagen en un buscador o de imágenes o en varios a la vez con un solo clic.
 * [Shodan:](https://www.shodan.io) indica información sobre la IP de la dirección web visualizada como puertos abiertos, ubicación, propietario, tecnologías usadas, vulnerabilidades otros servicios.
 * [Sidebery:](https://github.com/mbnuqw/sidebery) visualiza los marcadores como un árbol de carpetas en la barra lateral. Incluye un buscador que permite encontrar de forma rápida los marcadores teniendo en cuenta las definiciones de cada uno, ejemplo: podemos buscar barco, IP, avión y nos aparecerán listados los relacionados.
 * [SingleFile:](https://github.com/gildas-lormeau/SingleFile) añade un guardado completo de una o varias páginas en formato HTML o PDF.
 * [User-Agent Switcher and Manager](https://add0n.com/useragent-switcher.html) cambia el "user-agent" a cualquier sistema operativo o navegador.
 * [WayBackMachine:](https://github.com/internetarchive/wayback-machine-webextension) visualización y archivado de webs en WayBackMacnine a petición.
 * [Web Archives:](https://github.com/dessant/web-archives#readme) facilita la búsqueda de capturas y cacheado de direcciones con un solo clic.
 * [WebScrapBook:](https://github.com/danny0838/webscrapbook) captura páginas en HTML con un solo clic.
 * [Zotero](https://www.zotero.org) extensión asociada a la aplicación Zotero, permite añadir referencias a las investigaciones desde el propio navegador.

![2024-03-22_13 01 50_x_vmware](https://github.com/javi-ag/OdysSINT/assets/153739397/622a7ae7-00ce-4f90-8e43-d52e30ed995b)
<sup>_Inicio de Perfil Ulysses en OVA Debian_</sup>

## :package: Instalación 
OdysSINT tiene varias opciones de instalación que se pueden ajustar a diferentes necesidades:

### **OVAs preconfiguradas**
Contienen todas las herramientas OSINT, herramientas complementarias, el perfil Ulysses para Firefox y Tor con las extensiones y marcadores además de estar personalizada con logos y fondo de pantalla, en dos sabores, Debian 12.5 o Ubuntu 22.04, ambos en castellano, se han eliminado los juegos y dejado el software por defecto y de ofimática. Para quien no quiere complicarse, en pocos minutos de descarga se importa en Virtual Box o en VMWare Player y a disfrutar!!!
 
### **Script configurable**
Instala el acceso directo del OdysSINT, todas las herramientas OSINT, las herramientas complementarias y/o el perfil Ulysses tanto en Firefox como en Tor, todo esto de forma conjunta o elemento a elemento, compatible con cualquier distribución basada en Debian (probado en Debian 12.5 y Ubuntu 22.04.03), la mejor opción si no queremos realizar una descarga de gran tamaño o para entornos ya existentes. Podemos descargar solo el [script](https://github.com/javi-ag/OdysSINT/raw/main/OdysSINT.sh) o clonar el repositorio, antes de su inicio hay que asegurarse de que el script tiene permisos de ejecución:
  ```bash
  git clone --depth=1 https://github.com/javi-ag/OdysSINT.git
  cd OdysSINT
  chmod +x OdysSINT.sh
  ./OdysSINT.sh
  ```
### **Solo perfil Ulysses para Windows**
Contiene los marcadores, extensiones y configuración personalizada del proyecto y puede ser configurado siempre que se disponga de una versión de Firefox reciente. Para quien no quiere probar otro sistema operativo. Seguiremos los siguientes pasos:
  - Descargamos e instalamos [Firefox para Windows](https://download.mozilla.org/?product=firefox-stub&os=win&lang=es-ES).
  - Descargamos [firefoxprofile.ulysses.zip](https://github.com/javi-ag/OdysSINT/raw/main/firefoxprofile.ulysses.zip).
  - Descargamos [pasos.Ulysses.Windows.zip](https://github.com/javi-ag/OdysSINT/raw/main/pasos.Ulysses.Windows.zip), extraemos y seguimos los pasos que indican los accesos directos.

### **Solo addons Firefox**
Se pueden instalar en los navegadores compatibles siguiendo el enlace de [addons de Ulysses](https://addons.mozilla.org/es/firefox/collections/18254528/OdysSINT)

### **Solo marcadores Ulysses**
Todos los marcadores pueden ser instalados o actualizados con la información que se encuentra en el enlace de [addons de Ulysses](https://addons.mozilla.org/es/firefox/collections/18254528/OdysSINT) en la extensión [BookmarkHub](https://github.com/dudor/BookmarkHub). Compatible con cualquier sistema operativo y navegador que acepte esta extensión.

> [!WARNING] 
> Al instalar Ulysses o sincronizar los marcadores con BookmarkHub cambiará el perfil de Firefox y/o se borrarán los marcadores existentes, [hacer una copia previamente](https://support.mozilla.org/es/kb/hacer-una-copia-de-seguridad-y-restaurar-tu-inform) si queremos recuperar la información.

## :arrow_down: Descargas 
### OVA Debian 12.5:
- [**Enlace a descarga**](https://javierag-my.sharepoint.com/:u:/g/personal/javier_aguilar_javierag_onmicrosoft_com/EV4OOh7Yk79NsLLkJJI3NMgBeOPmcCqkfQr63GrWbCEJ7w?e=9pPpuJ)
- **Contraseña acceso**: l76W&n30%W7V
- **SHA256sum**: 48e6ccb5bef92e4c12ad89ce4b5bc0d137d40d9899811e0572b7e1b058dfa538
- **Formato**: OVA
- **Tamaño**: 5,73GB
- **Usuario**: _ulysses_
- **Contraseña**: _ulysses_

### OVA Ubuntu 22.04.3:
- [**Enlace a descarga**](https://javierag-my.sharepoint.com/:u:/g/personal/javier_aguilar_javierag_onmicrosoft_com/EYlBqVEmZlFMkZsej2BeTG4BJ-SL4kmjamkxeoi12jEbqg?e=XkZWLs)
- **Contraseña acceso**: G'Tg2AY382%3
- **SHA256sum**: 006d22543a7f786873602d2fe620f49a6707b8ad5f2c5963fd24c54098ac646f
- **Formato**: OVA
- **Tamaño**: 9,54GB
- **Usuario**: _ulysses_
- **Contraseña**: _ulysses_

> [!NOTE]
> En ambas OVAs, el usuario y la contraseña es la misma para el administrador de Archivebox.

## :computer: Demostración

[VIDEO](https://javierag-my.sharepoint.com/:v:/g/personal/javier_aguilar_javierag_onmicrosoft_com/ESDzDGksroZLvCfyz7r_sF0B1YVTBoIoagQ6VbLZr99wEg?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=6AtSN7)

## :open_book: FAQ
- **No aparece ningún mensaje durante la instalación**: el programa está diseñado para que sólo muestre la información relevante, para visualizar lo que está realizando abriremos el fichero de log desde el menú "Configuración de OdysSINT > Abrir log OdysSINT" o desde el directorio "OdysSINT\logs\AAAA-MM-DD-OdysSINT.log"
- **La aplicación no se instala y no aparece ningún mensaje**: borraremos la carpeta de la herramientas dentro del espacio de trabajo "OdysSINT" y revisaremos el fichero de log al volver a lanzar.
- **El script indica que no hay internet**: la conexión a internet será necesaria cuando queramos instalar cualquier elemento.
- **El script indica que no hay internet pero si dispongo de conexión externa**: verificar que no tenemos bloqueado el ping a la IP 8.8.8.8.

## Contacto :incoming_envelope:	
Para cualquier sugerencia o duda:
odyssint@protonmail.com
