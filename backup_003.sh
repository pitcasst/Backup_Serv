#!/bin/bash
 

 
################################################################################
 
# INICIO DEL MÓDULO DE INICIALIZACIÓN DE VARIABLES Y PARÁMETROS BÁSICOS
 
################################################################################
 

 
DIR_INI=$(echo $PWD)
 
FEC_INI=$(date +"%d-%b-%y")
 
FEC_RESP=$(date "+%d-%m-%y_%H-%M-%S")
 
NOM_HOST=$(cat /etc/hostname)
 
IP_ETH0_HOST=$(ifconfig eth0 | grep inet | grep -v inet6 | cut -d ":" -f 2 | cut -d " " -f 1)
 
NAME_ROOT=root
 
HOME_ROOT=/root
 
USER1000_HOST=$(cat /etc/passwd | grep 1000 | cut -d: -f1)
 
DIR_RESP_CA=/opt/respaldo/$NOM_HOST-$IP_ETH0_HOST/$FEC_INI/conf_avanzada
 
if [ ! -d $DIR_RESP_CA ]; then mkdir -p $DIR_RESP_CA; fi ; chmod -R 777 $DIR_RESP_CA/ ; chown -R $USER1000_HOST. $DIR_RESP_CA/
 
DIR_RESP_CB=/opt/respaldo/$NOM_HOST-$IP_ETH0_HOST/$FEC_INI/conf_basica
 
if [ ! -d $DIR_RESP_CB ]; then mkdir -p $DIR_RESP_CB; fi ; chmod -R 777 $DIR_RESP_CB/ ; chown -R $USER1000_HOST. $DIR_RESP_CB/
 
DIR_RESP_DU=/opt/respaldo/$NOM_HOST-$IP_ETH0_HOST/$FEC_INI/data_usuarios
 
if [ ! -d $DIR_RESP_DU ]; then mkdir -p $DIR_RESP_DU; fi ; chmod -R 777 $DIR_RESP_DU/ ; chown -R $USER1000_HOST. $DIR_RESP_DU/
 
DIR_RESP_VP=/opt/respaldo/$NOM_HOST-$IP_ETH0_HOST/$FEC_INI/valores_parametros
 
if [ ! -d $DIR_RESP_VP ]; then mkdir -p $DIR_RESP_VP; fi ; chmod -R 777 $DIR_RESP_VP/ ; chown -R $USER1000_HOST. $DIR_RESP_VP/
 

 
# Parámetros de Variables de Inicialización del Script
 

 
################################################################################
 
# FINAL DEL MÓDULO DE INICIALIZACIÓN DE VARIABLES Y PARÁMETROS BÁSICOS PARA EL RESPALDO
 
################################################################################
 

 
################################################################################
 
# INICIO DEL MÓDULO DE RESPALDO DE CONFIGURACIÓN BÁSICA DE EQUIPOS
 
################################################################################
 

 
cd $DIR_RESP_CB
 

 
# RESPALDO DE ARCHIVOS IMPORTANTES
 
cp /etc/grub2.cfg ./grub.cfg.bck-$FEC_RESP
 
cp /boot/config-$(uname -r) ./config-$(uname -r).bck-$FEC_RESP
 
cp /etc/bash.bashrc ./bash.bashrc.bck-$FEC_RESP
 
cp /etc/crontab ./crontab.bck-$FEC_RESP
 
##cp /etc/debian_version ./crontab.bck-$FEC_RESP
 
## cp /etc/environment ./environment.bck-$FEC_RESP
 
cp /etc/fstab ./fstab.bck-$FEC_RESP
 
cp /etc/group ./group.bck-$FEC_RESP
 
cp /etc/hostname ./hostname.bck-$FEC_RESP
 
cp /etc/hosts ./hosts.bck-$FEC_RESP
 
cp /etc/hosts.allow ./hosts.allow.bck-$FEC_RESP
 
cp /etc/hosts.deny ./hosts.deny.bck-$FEC_RESP
 
cp /etc/issue ./issue.bck-$FEC_RESP
 
cp /etc/issue.net ./issue.net.bck-$FEC_RESP
 
cp /etc/logrotate.conf ./logrotate.conf.bck-$FEC_RESP
 
cp /etc/motd ./motd.bck-$FEC_RESP
 
cp /etc/ntp.conf ./ntp.conf.bck-$FEC_RESP
 
cp /etc/os-release ./os-release.bck-$FEC_RESP
 
cp /etc/passwd ./passwd.bck-$FEC_RESP
 
cp /etc/profile ./profile.bck-$FEC_RESP
 
cp /etc/rc.local ./rc.local.bck-$FEC_RESP
 
cp /etc/resolv.conf ./resolv.conf.bck-$FEC_RESP
 
cp /etc/rsyslog.conf ./rsyslog.conf.bck-$FEC_RESP
 
cp /etc/services ./services.bck-$FEC_RESP
 
cp /etc/shadow ./shadow.bck-$FEC_RESP
 
cp /etc/shell ./shell.bck-$FEC_RESP
 
cp /etc/sudoers ./sudoers.bck-$FEC_RESP
 
cp /etc/sysctl.conf ./sysctl.conf.bck-$FEC_RESP
 
cp /etc/timezone ./timezone.bck-$FEC_RESP
 
#cp /etc/apt/sources.list ./etc-apt-sources.list.bck-$FEC_RESP
 
cp /etc/default/prelink ./etc-default-prelink.bck-$FEC_RESP
 
## cp /etc/network/interfaces ./etc-network-interfaces.bck-$FEC_RESP
 
## cp /etc/NetworkManager/NetworkManager.conf ./NetworkManager.conf.bck-$FEC_RESP
 
cp /etc/rsyslog.d/bash.conf ./etc-rsyslog.d-bash.conf.bck-$FEC_RESP
 
cp /etc/security/limits.conf ./security-limits.conf.bck-$FEC_RESP
 
cp /etc/ssh/sshd_config ./ssh-sshd_config.bck-$FEC_RESP
 
#cp /var/log/auth.log ./var-log-auth.log.bck-$FEC_RESP
 
cp /var/log/commands.log ./var-log-commands.log.bck-$FEC_RESP
 
cp /var/log/daemon.log ./var-log-daemon.log.bck-$FEC_RESP
 
cp /var/log/debug ./var-log-debug.bck-$FEC_RESP
 
cp /var/log/dmesg ./var-log-dmesg.bck-$FEC_RESP
 
cp /var/log/faillog ./var-log-faillog.bck-$FEC_RESP
 
cp /var/log/kern.log ./var-log-kern.log.bck-$FEC_RESP
 
cp /var/log/lastlog ./var-log-lastlog.bck-$FEC_RESP
 
cp /var/log/messages ./var-log-messages.bck-$FEC_RESP
 
#cp /var/log/syslog ./var-log-syslog.bck-$FEC_RESP
 
#cp /var/log/user.log ./var-log-user.log.bck-$FEC_RESP

asterisk -rx "database show" > /var/log/db_asterisk.txt

cp /var/log/db_asterisk.txt ./var-log-db_asterisk.log.bck-$FEC_RESP

 
# Incluya cualquier otro archivo importante que desee respaldar
 

 
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
 

 
# RESPALDO DE CARPETAS IMPORTANTES
 
tar cvpzf dir_httpd-bck-$FEC_RESP.tar.gz /etc/httpd/
 
#tar cvpzf dir_mysql-bck-$FEC_RESP.tar.gz /var/lib/mysql
 
#tar cvpzf dir_perl-bck-$FEC_RESP.tar.gz /etc/perl
 
#tar cvpzf dir_php5-bck-$FEC_RESP.tar.gz /etc/php5
 
#tar cvpzf dir_phppgadmin-bck-$FEC_RESP.tar.gz /etc/phppgadmin
 
#tar cvpzf dir_postgresql-bck-$FEC_RESP.tar.gz /etc/postgresql
 
#tar cvpzf dir_python-bck-$FEC_RESP.tar.gz /etc/python
 
#tar cvpzf dir_python2.7-bck-$FEC_RESP.tar.gz /etc/python2.7
 
#tar cvpzf dir_squid3-bck-$FEC_RESP.tar.gz /etc/squid3
 
#tar cvpzf dir_squidguard-bck-$FEC_RESP.tar.gz /etc/squidguard

tar cvpzf dir_etc_network-$FEC_RESP.tar.gz /etc/sysconfig/network-scripts/
 
tar cvpzf dir_ssh-bck-$FEC_RESP.tar.gz /etc/ssh
 
tar cvpzf dir_opt-$FEC_RESP.tar.gz /opt/$tu_carpeta
 
tar cvpzf dir_$NAME_ROOT-$FEC_RESP.tar.gz $HOME_ROOT
 
#tar cvpzf dir_var_lib_squidguard_db-$FEC_RESP.tar.gz /var/lib/squidguard/db
 
#tar cvpzf dir_var_log-$FEC_RESP.tar.gz /var/log
 
tar cvpzf dir_var_www-$FEC_RESP.tar.gz /var/www

tar cvpzf dir_etc_asterisk-$FEC_RESP.tar.gz /etc/asterisk

tar cvpzf dir_etc_dahdi-$FEC_RESP.tar.gz /etc/dahdi

#tar cvpzf dir_etc_asterisk_sounds-$FEC_RESP.tar.gz /var/lib/asterisk/sounds

tar cvpzf dir_etc_asterisk_moh-$FEC_RESP.tar.gz /var/lib/asterisk/moh/

 
chmod -R 777 $DIR_RESP_CB/ ; chown -R $USER1000_HOST. $DIR_RESP_CB/


 
# Incluya cualquier otro archivo importante que desee respaldar
 

 
################################################################################
 
# FINAL DEL MÓDULO DE RESPALDO DE CONFIGURACIÓN BÁSICA DE EQUIPOS
 
################################################################################
 

 
################################################################################
 
# INICIO DEL MÓDULO DE RESPALDO DE CONFIGURACIÓN AVANZADA DE EQUIPOS
 
################################################################################
 

 
cd $DIR_RESP_CA
 

 
# RESPALDO DE BD DE POSTGRESQL
 

 
##export PGUSER="postgres"

##export PGPASSWORD="123456"
 

 
##BD1_PGSQL=mi_bd_psql
 
##pg_dump -i -h localhost -p 5432 -s -f "$DIR_RESP_CA/$BD1_PGSQL-$FEC_RESP.sql" $BD1_PGSQL
 
# PGUSER=postgres PGPASSWORD=123456 pg_dump -i -h localhost -p 5432 -s -f "$DIR_RESP_CA/$BD1_PGSQL-$FEC_RESP.sql" $BD1_PGSQL
 
# Respalda el Esquema (solamente) de la BD1_PGSQL
 

 
## pg_dump -i -h localhost -p 5432 -U postgres -F t -b -v -f "$DIR_RESP_CA/$BD1_PGSQL-$FEC_RESP.backup" $BD1_PGSQL
 
# PGUSER=postgres PGPASSWORD=123456 pg_dump -i -h localhost -p 5432 -U postgres -F t -b -v -f "$DIR_RESP_CA/$BD1_PGSQL-$FEC_RESP.backup" $BD1_PGSQL
 
# Respalda toda la Data completa de la BD1_PGSQL
 

 
##unset PGUSER
 
##unset PGPASSWORD
 

 
# RESPALDO DE BD DE MYSQL
 

 
MYSQLPASSWORD="root"
 
MYSQLUSER=""
 

 
BD1_MYSQL=asteriskcdr
 

 
mysqldump -u $MYSQLPASSWORD $MYSQLUSER --add-drop-database --databases --events --ignore-table=mysql.events $BD1_MYSQL > $DIR_RESP_CA/$BD1-$FEC_RESP.sql
 
# mysqldump -u $MYSQLPASSWORD -p$MYSQLUSER --add-drop-database --all-databases --events --ignore-table=mysql.events > $DIR_RESP_CA/$ALL-BD-$FEC_RESP.sql
 
# Respalda toda la Data completa de la BD1_MYSQL
 

 
## mysqldump -u $MYSQLPASSWORD -p$MYSQLUSER --add-drop-database --databases -d $BD1_MYSQL > $DIR_RESP_CA/$BD1-$FEC_RESP.sql
 
# mysqldump -u $MYSQLPASSWORD -p$MYSQLUSER --add-drop-database --all-databases -d > $DIR_RESP_CA/$BD1-$FEC_RESP.sql
 
# Respalda el Esquema (solamente) de la BD1_MYSQL
 

 
unset MYSQLUSER
 
unset MYSQLPASSWORD
 

 
################################################################################
 
# FINAL DEL MÓDULO DE RESPALDO DE CONFIGURACIÓN AVANZADA DE EQUIPOS
 
################################################################################
 

 
################################################################################
 
# INICIO DEL MÓDULO DE RESPALDO DE DATA ESENCIAL DE LOS USUARIOS DEL EQUIPOS
 
################################################################################
 

 
## cd $DIR_RESP_DU
 

 
## tar cvpzf dir_$USER1000_HOST-$FEC_RESP.tar.gz /home/$USER1000_HOST
 
# tar cvpzf dir_$USER1000_HOST-$FEC_RESP.tar.gz /home/$USER1000_HOST $DIR_RESP_CB/ --exclude="Descargas" --exclude="Download" --exclude="Imágenes" --exclude="Images" --exclude=Música" --exclude=Music --exclude=Vídeos --exclude=Videos --exclude=*.exe --exclude=*.com --exclude=*.dll --exclude=*.mp3 --exclude=*.avi --exclude=*.mkv --exclude=*.msi --exclude=*.mpg --exclude=*.wmv --exclude=*.wma
 
# Habilitar la linea superior en caso de que desee excluir tipos de archivos
 
################################################################################
 
# FINAL DEL MÓDULO DE RESPALDO DE DATA ESENCIAL DE LOS USUARIOS DEL EQUIPOS
 
################################################################################
 

 
################################################################################
 
# INICIO DEL MÓDULO DE RESPALDO DE VALORES Y PARAMETROS DEL EQUIPO
 
################################################################################




cd /root/

echo '
 
################################################################################
 
# RESPALDO ZABBIX OK 

################################################################################
 
' > status_backup_$FEC_INI.txt







 
cd $DIR_RESP_VP
 

 
lshw -html > auditoria_tecnica_lshw.html
 
lshw -short > auditoria_tecnica_lshw_short.txt
 
lshw -businfo > auditoria_tecnica_lshw_businfo.txt
 

 
# Generar reportes del Hardware del Equipo en diversos formatos de archivos.
 
echo '
 
################################################################################
 
# MI_NOMBRE - CONESSIS_S.A_DE_C.V
 
# LINUX POST INSTALL - RESPALDO DE VALORES Y PARAMETROS DEL EQUIPO
 
# FECHA DEL RESPALDO: $FEC_RESP
 
################################################################################
 
================================================================================
 
' > auditoria_tecnica_$FEC_INI.txt
 
echo '
 
================================================================================
 
' >> auditoria_tecnica_$FEC_INI.txt
 
echo '
 
# ALMACENAMIENTO DE VARIABLES INFORMATIVAS
 
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
 
' >> auditoria_tecnica_$FEC_INI.txt
 

 
NOMBRE_HOST=$(cat /etc/hostname) ; echo "HOST: $NOMBRE_HOST" >> auditoria_tecnica_$FEC_INI.txt ; echo "" >> auditoria_tecnica_$FEC_INI.txt
 
# Nombre del Equipo.
 

 
FECHA_ACTUAL_EXT=$(date "+%d-%m-%y_%H-%M-%S") ; echo "FECHA: $FECHA_ACTUAL_EXT" >> auditoria_tecnica_$FEC_INI.txt ; echo "" >> auditoria_tecnica_$FEC_INI.txt
 
# Fecha actual extendida del Sistema
 

 
VERSION_SISTEMA=$(cat /etc/os-release | grep VERSION= | sed -n '1p' | sed 's/VERSION=//' | sed 's/"//g') ; echo "VERSION DE LA DISTRO: $VERSION_SISTEMA" >> auditoria_tecnica_$FEC_INI.txt ; echo "" >> auditoria_tecnica_$FEC_INI.txt
 
# Versión del Sistema Operativo
 

 
# Agregue cualquier otra línea de Shell Scripting de su elección
 

 
################################################################################
 
# INICIO DEL MÓDULO DE MANTENIMIENTO DE LOS RESPALDO DEL EQUIPO
 
################################################################################
 

 
chmod -R 777 $DIR_RESP_CA/ ; chown -R $USER1000_HOST. $DIR_RESP_CA/
 
chmod -R 777 $DIR_RESP_CB/ ; chown -R $USER1000_HOST. $DIR_RESP_CB/
 
chmod -R 777 $DIR_RESP_DU/ ; chown -R $USER1000_HOST. $DIR_RESP_DU/
 
chmod -R 777 $DIR_RESP_VP/ ; chown -R $USER1000_HOST. $DIR_RESP_VP/
 
# Otorgar permisos y propiedad adecuados a los archivos del Respaldo.
 

 
DIAS=30
 
find $DIR_RESP_CA -type f -name '*' -mtime +$DIAS -exec rm -rf {} \;
 
find $DIR_RESP_CB -type f -name '*' -mtime +$DIAS -exec rm -rf {} \;
 
find $DIR_RESP_DU -type f -name '*' -mtime +$DIAS -exec rm -rf {} \;
 
find $DIR_RESP_VP -type f -name '*' -mtime +$DIAS -exec rm -rf {} \;
 
# Conservar los dias de respaldos locales configurados
 

 
################################################################################
 
# FINAL DEL MÓDULO DE MANTENIMIENTO DE LOS RESPALDO DEL EQUIPO
 
################################################################################
 

 
################################################################################
 
# INICIO DEL MÓDULO DE COPIADO REMOTO DE LOS RESPALDO DEL EQUIPO
 
################################################################################
 

 
# PARÁMETROS PARA EL COPIADO REMOTO DE LOS RESPALDOS
 
## USER_SERV_RESP=operador
 
## IP_SERV_RESP=172.16.196.10
 
# PTO_SERV_RESP=4568
 
## DIR_SERV_RESP=/home/operador/tecnologia/Respaldos_Servidores
 
## DIR_SERV_RESP2=/home/operador/tecnologia/Respaldos_Servidores/Dir_Respaldo/*
 
## DIR_USER_SAMBA=/home/samba/tecnologia/Respaldos_Servidores/Dir_Respaldo/
 
#DIR_RESP_HOST=/opt/respaldo/

DIR_RESP_HOST=/opt/respaldo



 
# COPIADO REMOTO DE LOS RESPALDOS USANDO SCP
 
# scp -r $DIR_RESP_HOST $USER_SERV_RESP@$IP_SERV_RESP:$DIR_SERV_RESP
 
# Copiado automatico de los respaldos locales al servidor de backup
 


 
# COPIADO REMOTO DE LOS RESPALDOS USANDO RSYNC
 
## rsync -abhv -e 'ssh -p 4568' --iconv=utf-8,iso8859-15 --recursive $DIR_RESP_HOST $USER_SERV_RESP@$IP_SERV_RESP:$DIR_SERV_RESP
 
## ssh operador@172.16.196.10 -p 4568 chmod 777 -R $DIR_SERV_RESP2
 
## ssh operador@172.16.196.10 -p 4568 chown operador. -R $DIR_SERV_RESP2
 
## ssh operador@172.16.196.10 -p 4568 mv $DIR_SERV_RESP2 $DIR_USER_SAMBA


# COPIADO REMOTO DE LOS RESPALDOS POR GDRIVE

DIR_GDRIVE=1lRWh2MoRvoG_FdeA06eRrhpAHQ4DAYWK

#cd $DIR_RESP_HOST

/usr/local/bin/gdrive upload --recursive --parent $DIR_GDRIVE $DIR_RESP_HOST/$NOM_HOST-$IP_ETH0_HOST/*

 

 
################################################################################
 
# FINAL DEL MÓDULO DE COPIADO REMOTO DE LOS RESPALDO DEL EQUIPO
 
################################################################################
 

 
################################################################################
 
# INICIO DEL MÓDULO DE NOTIFICACIÓN REMOTA DE LOS RESPALDO DEL EQUIPO
 
################################################################################
 

 
## echo "Respaldo Ejecutado en $NOM_HOST-$IP_ETH0_HOST" ; echo "" ; cat auditoria_tecnica_$FEC_INI.txt | mail -s "Notificación de Ejecución de Respaldo y Auditoria Programada" pcastillo@conessis.com.mx
 
# Ejecutar correo de notificación de realización de respaldos.
 
### Borra crpeta generada de respaldo

rm -rf /opt/respaldo/

 
################################################################################
 
# FINAL DEL MÓDULO DE NOTIFICACION REMOTA DE LOS RESPALDO DEL EQUIPO
 
################################################################################
