# $NetBSD: Makefile,v 1.132 2012/02/06 12:39:59 wiz Exp $

PKG_DESTDIR_SUPPORT=	user-destdir

.include "Makefile.common"
PKGREVISION=		7

COMMENT=	Open Source cross-platform word processor

# GTK1 version and previous name of the GTK2 version
CONFLICTS=	abiword-personal-[0-9]* abiword2-[0-9]*

USE_TOOLS+=		perl
CONFIGURE_ARGS+=	--disable-builtin-plugins
CONFIGURE_ARGS+=	--enable-plugins=""
CONFIGURE_ARGS+=	--without-gnomevfs

REPLACE_SH+=	${WRKDIR}/${DISTNAME}/abiword-docs/make-html.sh
REPLACE_PERL+=	user/wp/scripts/abw2html.pl

.include "../../textproc/enchant/buildlink3.mk"
.include "../../databases/shared-mime-info/mimedb.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
