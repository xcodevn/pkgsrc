# $NetBSD: Makefile,v 1.8 2007/05/23 09:39:13 xtraeme Exp $
#

DISTNAME=	txt2man-1.5.5
CATEGORIES=	converters
MASTER_SITES=	http://mvertes.free.fr/download/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://mvertes.free.fr/
COMMENT=	Convert flat ASCII text to man page format

PKG_DESTDIR_SUPPORT=	user-destdir

NO_BUILD=	YES
USE_TOOLS+=	gawk

INSTALL_MAKE_FLAGS+=	prefix=${DESTDIR}${PREFIX}

.include "../../mk/bsd.pkg.mk"
