# $NetBSD: Makefile,v 1.14 2008/07/14 12:56:05 joerg Exp $
#

DISTNAME=	lib3ds-1.2.0
PKGREVISION=	6
CATEGORIES=	graphics devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=lib3ds/}

MAINTAINER=	rh@NetBSD.org
HOMEPAGE=	http://lib3ds.sourceforge.net/
COMMENT=	3D Studio File Format Library

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=	YES
USE_LIBTOOL=	YES
USE_TOOLS=	autoconf automake

pre-configure:
	cd ${WRKSRC} && libtoolize --force
	cd ${WRKSRC} && autoreconf -i --force

.include "../../graphics/Mesa/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
