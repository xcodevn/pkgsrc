# $NetBSD: Makefile,v 1.14 2012/02/06 12:41:40 wiz Exp $

PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../meta-pkgs/xfce4/Makefile.common"

XFCE4_VERSION=	0.5.2

DISTNAME=	xarchiver-${XFCE4_VERSION}
PKGNAME=	xfce4-xarchiver-${XFCE4_VERSION}
PKGREVISION=	10
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=xarchiver/}
COMMENT=	Xfce archiver handler


.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/libxfce4gui/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
