# $NetBSD: Makefile,v 1.2 2011/08/25 15:24:14 wiz Exp $
#

DISTNAME=	tarsnap-autoconf-1.0.31
PKGNAME=	${DISTNAME:S/-autoconf//}
CATEGORIES=	sysutils archivers security
MASTER_SITES=	https://www.tarsnap.com/download/
EXTRACT_SUFX=	.tgz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.tarsnap.com/
COMMENT=	Secure online backup service
LICENSE=	tarsnap-license

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=		yes
INSTALL_MAKE_FLAGS=	sysconfdir=${PREFIX}/share/examples/tarsnap

CONF_FILES=	${PREFIX}/share/examples/tarsnap/tarsnap.conf.sample ${PKG_SYSCONFDIR}/tarsnap.conf

LDFLAGS+= -L${SSLBASE:Q}/lib

.include "../../security/openssl/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
