# $NetBSD: Makefile,v 1.9 2011/02/21 16:30:44 taca Exp $

MODNAME=		exif
PKGREVISION=		2
CATEGORIES+=		graphics
COMMENT=		PHP extension to extract information from EXIF headers

PKG_DESTDIR_SUPPORT=	user-destdir

CONFIGURE_ARGS+=	--with-${MODNAME}=shared
USE_PHP_EXT_PATCHES=	yes

.include "../../lang/php/ext.mk"
.include "../../mk/bsd.pkg.mk"
