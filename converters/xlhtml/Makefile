# $NetBSD: Makefile,v 1.14 2008/07/14 12:56:00 joerg Exp $
#

DISTNAME=		xlhtml-0.5
PKGREVISION=		2
CATEGORIES=		converters
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=chicago/}
EXTRACT_SUFX=		.tgz

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://chicago.sourceforge.net/xlhtml/
COMMENT=		Microsoft xls/ppt to HTML converter

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=		YES
USE_TOOLS+=		gmake csh:run

REPLACE_CSH=		xlhtml/nsxlview xlhtml/nsopen xlhtml/gpdemo
REPLACE_CSH+=		ppthtml/nspptview

# fabs
LIBS.SunOS+=		-lm

.include "../../mk/bsd.pkg.mk"
