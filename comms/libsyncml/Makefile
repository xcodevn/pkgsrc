# $NetBSD: Makefile,v 1.5 2012/02/16 17:21:15 hans Exp $
#

DISTNAME=	libsyncml-0.4.5
PKGREVISION=	3
CATEGORIES=	comms
MASTER_SITES=	http://libsyncml.opensync.org/download/releases/0.4.5/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	dillo@NetBSD.org
HOMEPAGE=	http://libsyncml.opensync.org/
COMMENT=	C library implementation of the SyncML protocol

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c
USE_LIBTOOL=	yes

.include "../../mk/bsd.prefs.mk"

CONFIGURE_ARGS+=	--disable-http
.if ${OPSYS} != "SunOS"
CONFIGURE_ARGS+=	--enable-bluetooth
.endif
CONFIGURE_ARGS+=	--enable-obex

PKGCONFIG_OVERRIDE+=	libsyncml-1.0.pc.in

.include "../../comms/openobex/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../textproc/wbxml2/buildlink3.mk"
# XXX libsoup (http)
.include "../../mk/bsd.pkg.mk"
