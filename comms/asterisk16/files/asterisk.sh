#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD: asterisk.sh,v 1.3 2010/10/19 19:21:21 jnemeth Exp $
#
# PROVIDE: asterisk
# REQUIRE: DAEMON
# KEYWORD: shutdown
#
# You will need to set some variables in /etc/rc.conf to start Asterisk:
#
# asterisk=YES

if [ -f /etc/rc.subr ]
then
	. /etc/rc.subr
fi

name="asterisk"
rcvar=$name
command="@PREFIX@/sbin/asterisk"
pidfile=@ASTVARRUNDIR@/${name}.pid
required_files="@PKG_SYSCONFDIR@/asterisk.conf"
extra_commands="reload"
start_precmd=asterisk_prestart

auser="@ASTERISK_USER@"
agroup="@ASTERISK_GROUP@"
command_args="-U $auser -G $agroup -n"

asterisk_prestart() {
	if test ! -d @ASTVARRUNDIR@; then
		mkdir @ASTVARRUNDIR@
	fi
	chown $auser:$agroup @ASTVARRUNDIR@
	chmod 0755 @ASTVARRUNDIR@
}

stop_cmd="$command -nr -x 'stop gracefully' >/dev/null"
reload_cmd="$command -nr -x 'reload' >/dev/null"
asterisk_nice="-20"

load_rc_config $name
run_rc_command "$1"
