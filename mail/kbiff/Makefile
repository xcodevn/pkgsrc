# $NetBSD: Makefile,v 1.46 2012/02/09 21:44:28 sbd Exp $

DISTNAME=	kbiff-3.9
PKGREVISION=	11
CATEGORIES=	devel kde
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=kbiff/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	markd@NetBSD.org
HOMEPAGE=	http://www.kbiff.org
COMMENT=	Mail notification utility for KDE

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=		gmake perl
USE_LANGUAGES=		c c++
USE_LIBTOOL=		yes
GNU_CONFIGURE=		yes
SET_LIBDIR=		yes
SHLIBTOOL_OVERRIDE=	# empty

.include "../../meta-pkgs/kde3/kde3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../x11/kdelibs3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
