# $NetBSD$

PKG_OPTIONS_VAR=	PKG_OPTIONS.gld
PKG_SUPPORTED_OPTIONS=	mysql pgsql
PKG_DEFAULT_OPTIONS+=	mysql

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mmysql)
.  include "../../mk/mysql.buildlink3.mk"
CONFIGURE_ARGS+=	--with-mysql=${BUILDLINK_PREFIX.mysql-client}
.endif

.if !empty(PKG_OPTIONS:Mpgsql)
.  include "../../mk/pgsql.buildlink3.mk"
CONFIGURE_ARGS+=	--with-pgsql=${BUILDLINK_PREFIX.postgresql-libs}
.endif
