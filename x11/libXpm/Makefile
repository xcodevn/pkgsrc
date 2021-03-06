# $NetBSD: Makefile,v 1.10 2010/01/15 18:39:00 tnn Exp $
#

DISTNAME=		libXpm-3.5.8
PKGREVISION=		1
CATEGORIES=		graphics x11
MASTER_SITES=		${MASTER_SITE_XORG:=lib/}
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		joerg@NetBSD.org
HOMEPAGE=		http://xorg.freedesktop.org/
COMMENT=		X PixMap Library from modular Xorg X11

CONFLICTS+=		xpm-[0-9]*

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LIBTOOL=		yes
USE_TOOLS+=		pkg-config xgettext
PKGCONFIG_OVERRIDE+=	xpm.pc.in
GNU_CONFIGURE=		yes
CONFIGURE_ENV+=		APP_MAN_SUFFIX=1

# Don't allow the configure script to find libintl.so or else the resulting
# libXpm will be linked against it, which is not necessary.  Instead, just
# pass down INTLLIBS in the build environment for use by the [cs]xpm
# Makefiles.
#
CONFIGURE_ENV+=		ac_cv_search_gettext=no
MAKE_ENV+=		INTLLIBS=${BUILDLINK_LDADD.gettext:Q}

.include "../../mk/bsd.prefs.mk"

.if ${X11_TYPE} == "native" || ${X11_TYPE} == "monolithic"
XPM_CFLAGS=	-I${X11BASE}/include
XPM_LIBS=	-Wl,-rpath,${X11BASE}/lib -L${X11BASE}/lib -lX11

SXPM_CFLAGS=	-I${X11BASE}/include
SXPM_LIBS=	-Wl,-rpath,${X11BASE}/lib -L${X11BASE}/lib -lXt -lXext

CONFIGURE_ARGS+=	XPM_CFLAGS=${XPM_CFLAGS:Q} \
			XPM_LIBS=${XPM_LIBS:Q} \
			SXPM_CFLAGS=${SXPM_CFLAGS:Q} \
			SXPM_LIBS=${SXPM_LIBS:Q}
.endif

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/xextproto/buildlink3.mk"
.include "../../x11/xproto/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
