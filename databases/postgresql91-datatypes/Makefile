# $NetBSD$

PKGNAME=	${DISTNAME:C/-/91-datatypes-/}
COMMENT=	PostgreSQL data types support modules

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	postgresql91-server>=${PKGVERSION_NOREV}:../../databases/postgresql91-server

.include "../../databases/postgresql91/Makefile.common"

CONFIGURE_ARGS+=	--with-ossp-uuid
# because global pg_config.h is included, we have to define this
CPPFLAGS+=		-DHAVE_UUID_H

BUILD_DIRS+=		contrib/citext
BUILD_DIRS+=		contrib/hstore
BUILD_DIRS+=		contrib/intarray
BUILD_DIRS+=		contrib/isn
BUILD_DIRS+=		contrib/ltree
BUILD_DIRS+=		contrib/lo
BUILD_DIRS+=		contrib/uuid-ossp
BUILD_DIRS+=		contrib/unaccent
BUILD_MAKE_FLAGS=	PGXS=1

.include "../../databases/postgresql91-client/buildlink3.mk"
.include "../../devel/ossp-uuid/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
